from django.contrib.auth import get_user_model
from django.db.models.functions import Lower
import graphene
from graphene_django import DjangoObjectType
from graphql_jwt.decorators import login_required


class UserType(DjangoObjectType):
    mutual_friends = graphene.List(lambda: UserType)

    class Meta:
        model = get_user_model()

    def resolve_mutual_friends(self, info):
        user = info.context.user

        if user.is_anonymous:
            return None
        return self.friends.all() & user.friends.all()


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
            user = get_user_model().objects.annotate(name_lower=Lower('name')
                                                     ).filter(name_lower=name.lower()).get()
            return user
        if email:
            user = get_user_model().objects.annotate(email_lower=Lower('email')
                                                     ).filter(email_lower=email.lower()).get()

            return user

        return None

    def resolve_users(root, info, name=None, email=None, **kwargs):
        """
        Get all the users or filter by name or email
        """
        users = get_user_model().objects.all()

        # Apply search filters if any
        if name:
            users = users.annotate(name_lower=Lower(
                'name')).filter(name_lower=name.lower())
        if email:
            users = users.annotate(email_lower=Lower(
                'email')).filter(email_lower=email.lower())
        return users

    @login_required
    def resolve_me(root, info):
        """
        Get currently logged in user
        """
        user = info.context.user
        return user

# Mutations


class AddFriend(graphene.Mutation):
    class Arguments:
        user_id = graphene.ID(required=True)

    user = graphene.Field(UserType)

    @classmethod
    @login_required
    def mutate(cls, root, info, user_id):
        user = info.context.user

        friend = get_user_model().objects.filter(pk=user_id).get()

        user.friends.add(friend)
        user.save()
        return AddFriend(user=user)


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
    add_friend = AddFriend.Field()
