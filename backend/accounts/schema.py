from django.contrib.auth import get_user_model
from django.db.models.functions import Lower
import graphene
from graphene_django import DjangoObjectType


class UserType(DjangoObjectType):
    class Meta:
        model = get_user_model()


# Queries
class Query(graphene.ObjectType):

    me = graphene.Field(UserType)

    user = graphene.Field(UserType, name=graphene.String(required=False),
                          email=graphene.String(required=False),)

    users = graphene.List(UserType, name=graphene.String(required=False),
                          email=graphene.String(required=False),)

    def resolve_user(root, info, name=None, email=None):
        """
        Search for a single user
        """

        if name:
            return get_user_model().objects.annotate(name_lower=Lower('name')).filter(name_lower=name.lower()).first()
        if email:
            return get_user_model().objects.annotate(email_lower=Lower('email')).filter(email_lower=email.lower()).first()

        return None

    def resolve_users(root, info, name=None, email=None, **kwargs):
        """
        Get all the users or filter by name or email
        """
        users = get_user_model().objects.all().order_by('-created_at')

        # Apply search filters if any
        if name:
            users = users.annotate(name_lower=Lower(
                'name')).filter(name_lower=name.lower())
        if email:
            users = users.annotate(email_lower=Lower(
                'email')).filter(email_lower=email.lower())
        return users

    def resolve_me(root, info):
        """
        Get currently logged in user
        """
        user = info.context.user
        if not user.is_authenticated:
            raise Exception('Authentication Failure!')
        return user

# Mutations


class CreateUser(graphene.Mutation):
    user = graphene.Field(UserType)

    class Arguments:
        name = graphene.String(required=True)
        password = graphene.String(required=True)
        email = graphene.String(required=True)

    @classmethod
    def mutate(cls, root, info, name, password, email):
        user = get_user_model().objects.create_user(
            name=name,
            email=email,
            password=password
        )

        return CreateUser(user=user)


class Mutation(graphene.ObjectType):
    create_user = CreateUser.Field()
