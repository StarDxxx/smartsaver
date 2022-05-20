import graphene
import graphql_jwt
import accounts.schema

class Query(accounts.schema.Query, graphene.ObjectType):
  """
  Query for getting the data from the server.
  """
  pass

class Mutation(accounts.schema.Mutation,  graphene.ObjectType):
  """
  Mutation for sending the data to the server.
  """
  token_auth = graphql_jwt.ObtainJSONWebToken.Field()
  verify_token = graphql_jwt.Verify.Field()
  refresh_token = graphql_jwt.Refresh.Field()


# Create schema
schema = graphene.Schema(query=Query, mutation=Mutation)
