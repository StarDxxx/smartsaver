import graphene
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
  pass


# Create schema
schema = graphene.Schema(query=Query, mutation=Mutation)
