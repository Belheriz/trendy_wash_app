import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'package:trendy_mobile_1/homepage/notification/notification.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/callcenter/callcenter.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/coupon/coupon.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/exreward/exreward.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/history/history.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/paymentmethod/paymentmethod.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/personalinfo/personalinfo.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/stamp/stamp.dart';
import 'package:trendy_mobile_1/main.dart';

import '../locationService/location_service.dart';
import 'wash/washModel.dart';
import 'dart:io';

final HttpLink httpLink = HttpLink(
  'https://api.graphql.trendywash.net/',
);
final AuthLink authLink = AuthLink(
  getToken: () async =>
      'Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MDZkMjM0ZTM5MTJmZTgwZDEyODQ3MCIsImlhdCI6MTY3ODIxODk5OSwiZXhwIjoxNjc4MzA1Mzk5fQ.NF9ovfe--0-DlTTkGW4mFORI1YTDSDWOK7cXDLzZSWo>',
);

final Link link = authLink.concat(httpLink);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  ),
);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

class homepage extends StatelessWidget {
  homepage({super.key});

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

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = new MyHttpOverrides();
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: white,
          fontFamily: 'LineseedsanRg',
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<washmodel>? _laundry;

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
    // _load();
  }

  void getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    if (locationData != null) {
      setState() {
        lat1 = locationData.latitude!.toStringAsFixed(6);
        lon1 = locationData.longitude!.toStringAsFixed(6);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            centerTitle: true,
            title: Image.asset('assets/images/logo.png'),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: notification(),
                          type: PageTransitionType.rightToLeft));
                }),
                icon: Icon(
                  Icons.ring_volume,
                  color: Color.fromRGBO(9, 59, 157, 20),
                ),
              ),
            ],
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 90),
              height: 220,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xffF4F6F9),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/washpromotion1.png',
                    ),
                    iconSize: 220,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/washpromotion2.png',
                    ),
                    iconSize: 220,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/washpromotion1.png',
                    ),
                    iconSize: 220,
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(240.0)),
      drawer: const NavigationDrawer(),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    child: const Text(
                      'Trendy Wash ใกล้บ้าน',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LineseedsanBd',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'ดูทั้งหมด >',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'LineseedsanRg',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, elevation: 0),
                  )
                ],
              ),
            ),
            Query(
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
                return SingleChildScrollView(
                  child: ListView.builder(
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
                        onTap: () {},
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
                                Text('')
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
                  ),
                );
              },
            ),
            Center(
              child: Column(
                children: [
                  Text(lat1 ?? "no lat read"),
                  Text(lon1 ?? "nol lon read")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  final String svghistory = 'assets/svgassets/history1.svg';
  final String svgstamp = 'assets/svgassets/stamp1.svg';
  final String svgcoupon = 'assets/svgassets/coupon.svg';
  final String svgwallet = 'assets/svgassets/wallet1.svg';
  final String svgchat = 'assets/svgassets/chat1.svg';
  final String svgthai = 'assets/svgassets/Thailand.svg';
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItem(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        child: InkWell(
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF093B9E),
                      Color(0xFF093B9E),
                      Color(0xFF0490B5),
                      Color(0xFF0764A9)
                    ], begin: Alignment.centerRight, end: Alignment.centerLeft),
                    border: Border.all(
                      width: 4,
                      color: Color.fromRGBO(216, 137, 92, 50),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  height: 130 + MediaQuery.of(context).padding.top,
                  width: 250 + MediaQuery.of(context).padding.top,
                  child: Stack(
                    children: [
                      Container(
                        height: 20 + MediaQuery.of(context).padding.top,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color(0xFFC06035),
                              Color(0xFFB15530),
                              Color(0xFFB15530),
                              Color(0xFFD98A5D),
                              Color(0XFFA94F2E),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 110 +
                                      MediaQuery.of(context).padding.right),
                              child: Text(
                                'Bronze Member',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 35 + MediaQuery.of(context).padding.left,
                          top: -10 + MediaQuery.of(context).padding.top,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffA94F2E),
                          //backgroundImage:AssetImage('assets/images/exprofile.png'),
                          radius: 30,
                          child: CircleAvatar(
                            radius: 27,
                            backgroundImage:
                                AssetImage('assets/images/exprofile.png'),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 190 + MediaQuery.of(context).padding.left,
                            top: 30 + MediaQuery.of(context).padding.top),
                        child: Image.asset('assets/images/profilelogo.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 60 + MediaQuery.of(context).padding.top,
                          left: 10 + MediaQuery.of(context).padding.left,
                        ),
                        child: Text(
                          'first Lastname',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 85 + MediaQuery.of(context).padding.top,
                            left: 10 + MediaQuery.of(context).padding.left),
                        child: Text(
                          '089-597-0000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItem(BuildContext context) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('ข้อมูลส่วนตัว'),
            onTap: () {
              pushNewScreen(
                context,
                screen: const personalinfo(),
                withNavBar: false,
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svghistory),
            title: const Text('ประวัติการใช้งาน'),
            onTap: () {
              pushNewScreen(
                context,
                screen: const historypage(),
                withNavBar: false,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: const Text('แลกรางวัล'),
            onTap: () {
              pushNewScreen(
                context,
                screen: const exreward(),
                withNavBar: false,
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgcoupon),
            title: const Text('เก็บคูปอง'),
            onTap: () {
              pushNewScreen(
                context,
                screen: const couponpage(),
                withNavBar: false,
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgstamp),
            title: const Text('บัตรสะสมแสตมป์'),
            onTap: () {
              pushNewScreen(
                context,
                screen: const stamppage(),
                withNavBar: false,
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgwallet),
            title: const Text('วิธีการชำระเงิน'),
            onTap: () {
              pushNewScreen(
                context,
                screen: const paymethpage(),
                withNavBar: false,
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgchat),
            title: const Text('ศูนย์บริการลูกค้า'),
            onTap: () {
              pushNewScreen(
                context,
                screen: const callcenterpage(),
                withNavBar: false,
              );
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: SvgPicture.asset(svgthai),
            title: const Text('ภาษาไทย'),
            onTap: () {},
          ),
          SizedBox(
            height: 120,
          ),
          Container(
            height: 40,
            width: 150,
            margin: EdgeInsets.only(left: 80),
            child: ElevatedButton(
              onPressed: (() {
                pushNewScreen(
                  context,
                  screen: MyApp(),
                  withNavBar: false,
                );
              }),
              child: Text(
                'ออกจากระบบ',
                style: TextStyle(
                  color: Color.fromRGBO(239, 78, 78, 20),
                ),
              ),
              style: ElevatedButton.styleFrom(
                //elevation: 0.8,
                backgroundColor: Color.fromRGBO(254, 228, 228, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      );
}
