import 'package:angel_framework/angel_framework.dart';
import 'package:graphql_schema/graphql_schema.dart';
import 'package:instatube_service/src/application/user_schema.dart';
import 'package:instatube_service/src/infrastructure/graphql/video.dart';

GraphQLSchema createSchema(Angel app) {
  var userSchema = UserSchema(app);

  var queryType = objectType(
    'Query',
    fields: [
      ...userSchema.queryFields(),
      ...videoQueryFields(app)
    ],
  );

  var mutationType = objectType(
    'Mutation',
    fields: [
      ...userSchema.mutationFields(),
      ...videoMutationFields(app)
    ],
  );

  return graphQLSchema(
    queryType: queryType,
    mutationType: mutationType,
  );
}
