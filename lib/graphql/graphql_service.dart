import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:trendy_mobile_1/graphql/graphql_config.dart';
import 'package:trendy_mobile_1/homepage/wash/washModel.dart';

class GraphQLService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<washmodel>> getLaundry() async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.networkOnly,
          document: gql(
            """
     query getSite(\$siteId: ID!){
      getSite(siteId: \$siteId){
        latitude
        longitude
        site_washer_count
        site_dryer_count
        site_name
        img_site
      }
    }

""",
          ),
          variables: {
            'siteId': '636caba997b41d387c6a2abf',
          },
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?['getSite'];

      if (res == null) {
        return [];
      }

      List<washmodel> laundrys =
          res.map((laundry) => washmodel.fromMap(map: laundry)).toList();
      return [];
    } catch (error) {
      throw Exception(error);
    }
  }
}
  /*query{
    getSite(siteId:"636caba997b41d387c6a2abf"){
 
    latitude
    longitude
    site_washer_count
    site_dryer_count
    site_name
    img_site
    
  }
}*/