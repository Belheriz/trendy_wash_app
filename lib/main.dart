import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/login/loginpage.dart';
import 'package:trendy_mobile_1/homepage/register/register.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

/*final HttpLink httpLink = HttpLink(
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
);*/
void main() async {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

  Widget blankspack() {
    return Container(
      child: SizedBox(height: 100),
    );
  }

  Widget blankspack1() {
    return Container(
      child: SizedBox(height: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);
    double h = displayHeight(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
        fontFamily: 'LineseedsanBd',
      ),
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF093B9E),
              Color(0xFF005C86),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.0),
          body: SafeArea(
            child: Expanded(
              child: Stack(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: 80 + MediaQuery.of(context).padding.top),
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      const Color(0xff093B9E),
                      const Color(0xff00BBA9).withOpacity(0.3),
                    ],
                    // stops: [0, 0.3],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 130 + MediaQuery.of(context).padding.top),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/BgStartpage.png',
                        width: w,
                      )
                    ],
                  ),
                ),
                blankspack(),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: w * 0.2,
                        top: h * 0.08,
                      ),
                      child: const Text(
                        'ยินดีต้อนรับสู่',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    /*SizedBox(
                      height: h * 0.01,
                    ),*/
                    Container(
                      margin: EdgeInsets.only(left: w * 0.01),
                      child: const Text(
                        'Trendy Wash App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    /*const SizedBox(
                      height: 5,
                    ),*/
                    Container(
                      margin: EdgeInsets.only(left: w * 0.1),
                      child: const Text(
                        'ซัก อบ ผ่านแอปง่ายๆนิดเดียว',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                blankspack1(),
                Container(
                  margin: EdgeInsets.only(
                    top: h * 0.5,
                  ),
                  height: h * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.04,
                      ),
                      Center(
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Container(
                        width: w * 0.8,
                        height: h * 0.05,
                        child: ElevatedButton(
                          onPressed: (() {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: registerpage(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          }),
                          child: Text(
                            'สมัครสมาชิก',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(9, 59, 158, 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: w * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //margin: EdgeInsets.only(right: 40),
                              child: Column(
                                children: [
                                  Image.asset('assets/images/facebook.png')
                                ],
                              ),
                            ),
                            Container(
                              //margin: EdgeInsets.only(right: 50),
                              child: IconButton(
                                onPressed: (() {}),
                                icon: SvgPicture.asset(
                                    'assets/svgassets/line.svg'),
                              ),
                            ),
                            Container(
                              // margin: EdgeInsets.only(left: 10),
                              child: IconButton(
                                onPressed: (() {}),
                                icon: SvgPicture.asset(
                                    'assets/svgassets/google.svg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text('มีบัญชีอยู่แล้ว?'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: ElevatedButton(
                              child: Text(
                                'เข้าสู่ระบบ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 187, 169, 100)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: loginpage(),
                                        type: PageTransitionType.rightToLeft));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(217, 245, 242, 100),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
