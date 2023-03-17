import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:location/location.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:trendy_mobile_1/graphql/graphql_service.dart';
import 'package:trendy_mobile_1/homepage/wash/washlauandry.dart';
import 'package:trendy_mobile_1/locationService/location_service.dart';
import 'washModel.dart';

class wash extends StatelessWidget {
  const wash({super.key, required this.graphQLClient});
  static const MaterialColor white = MaterialColor(
    whitePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(whitePrimaryValue),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
  static const int whitePrimaryValue = 0xFFFFFFFF;
  final ValueNotifier<GraphQLClient> graphQLClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
        fontFamily: 'LineseedsanRg',
      ),
      home: Washmainpage(
        client: graphQLClient,
      ),
    );
  }
}

class Washmainpage extends StatefulWidget {
  const Washmainpage({super.key, required this.client});
  final ValueNotifier<GraphQLClient> client;
  @override
  State<Washmainpage> createState() => _WashMainPageState(passClient: client);
}

class _WashMainPageState extends State<Washmainpage> {
  _WashMainPageState({required this.passClient});

  final ValueNotifier<GraphQLClient> passClient;
  bool typing = false;
  List<washmodel>? _laundry;
  GraphQLService _graphQLService = GraphQLService();
  String? lat1, lon1;
  String readRepositories = """
  query getSitesInfo( \$startLat: Float! \$startLon: Float! \$limit: Int!){
      getSitesInfo(startLat: \$startLat startLon: \$startLon limit:\$limit){
        distances
        site_washer_count
        site_dryer_count
        site_name
        img_site
        siteId
      }
    }
""";

  @override
  void initState() {
    super.initState();
    getLocation();
    //_load();
  }

  void getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    if (locationData != null) {
      setState() {
        lat1 = locationData.latitude!.toStringAsFixed(2);
        lon1 = locationData.longitude!.toStringAsFixed(2);
      }
    }
  }

  void _load() async {
    _laundry = null;
    _laundry = await _graphQLService.getLaundry(Id: '636caba997b41d387c6a2abf');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: typing
            ? TextBox()
            : Text(
                'พิมพ์ชื่อสาขาที่นี่',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                typing = !typing;
              });
            },
            icon: Icon(typing ? Icons.done : Icons.map_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment(-0.85, 0),
              child: Text(
                'สาขา Trendy Wash ใกล้ที่สุด ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Query(
                options: QueryOptions(
                  document: gql(readRepositories),
                  pollInterval: const Duration(seconds: 10),
                  variables: {
                    'startLat': 14.017384,
                    'startLon': 100.672640,
                    'limit': 10,
                  },
                ),
                builder: (QueryResult result,
                    {VoidCallback? refetch, FetchMore? fetchMore}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }

                  if (result.isLoading) {
                    return const Text('Loading');
                  }

                  List? repositories = result.data?['getSitesInfo'];

                  if (repositories == null) {
                    return const Text('No repositories');
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: repositories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final laundry = repositories[index];
                      return ListTile(
                        trailing: Icon(Icons.star),
                        /*leading: Image.network(
                          laundry?['img_site'] ?? '',
                          errorBuilder: ((context, error, stackTrace) {
                            return Text('Error Loading Image');
                          }),
                        ),*/
                        title: Text(
                          laundry?['site_name'] ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: washlaundry(
                              siteIdData: laundry?['siteId'] ?? '',
                              siteNameData: laundry?['site_name'] ?? "",
                              graphQLClient: passClient,
                            ),
                            withNavBar: false,
                          );
                        },
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(''),
                                SizedBox(
                                  width: 20,
                                ),
                                Image.asset('assets/images/Location.png'),
                                Text(
                                  laundry?['distances'] ?? '',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xff093B9D),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Align(
                                    alignment: Alignment(0, -0.5),
                                    child: Text(
                                      laundry?['site_washer_count'] ?? '',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xff00BBA9),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Align(
                                    alignment: Alignment(0, -0.5),
                                    child: Text(
                                      laundry?['site_dryer_count'] ?? '',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment(-0.9, 0),
                              child: Text(
                                'ว่าง 3 เครื่อง',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        decoration:
            InputDecoration(border: InputBorder.none, hintText: 'Search'),
      ),
    );
  }
}
