import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/login/loginpage.dart';
import 'package:trendy_mobile_1/homepage/register/register.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

class callcenterpage extends StatelessWidget {
  const callcenterpage({Key? key}) : super(key: key);

  static const MaterialColor blue = MaterialColor(
    whitePrimaryValue,
    <int, Color>{
      50: Color(0xFF093B9E),
      100: Color(0xFF093B9E),
      200: Color(0xFF093B9E),
      300: Color(0xFF093B9E),
      400: Color(0xFF093B9E),
      500: Color(whitePrimaryValue),
      600: Color(0xFF093B9E),
      700: Color(0xFF093B9E),
      800: Color(0xFF093B9E),
      900: Color(0xFF093B9E),
    },
  );
  static const int whitePrimaryValue = 0xFF093B9E;

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

  Widget textwelcline1() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: 100,
              top: 60,
            ),
            child: Text(
              'ยินดีต้อนรับสู่',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(right: 30),
            child: Text(
              'Trendy Wash App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              'ซัก อบ ผ่าน แอปๆง่ายนิดเดียว',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);
    double h = displayHeight(context) -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: blue,
        fontFamily: 'LineseedsanRg',
      ),
      home: Container(
        decoration: new BoxDecoration(
          /*image: DecorationImage(
            image: AssetImage('assets/images/callcenterBg.png'),
          ),*/
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
          appBar: AppBar(
            elevation: 0,
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const homepage()),
                );
              },
            ),
            title: Text(
              'ศูนย์บริการลูกค้า',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white.withOpacity(0.0),
          body: SafeArea(
            child: Expanded(
              child: Stack(children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      /*margin: EdgeInsets.only(
                          top: 20 + MediaQuery.of(context).padding.top),*/
                      child: Image.asset(
                        'assets/images/callcenterBg.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Align(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 550),
                        height: 220,
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [
                              Color.fromRGBO(9, 59, 158, 100),
                              Color.fromRGBO(9, 59, 158, 99.5),
                              Color.fromRGBO(9, 59, 158, 50),
                              Color.fromRGBO(9, 59, 158, 20),
                            ],
                            begin: new Alignment(0.0, 2),
                            end: new Alignment(0.0, -0.5),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                blankspack(),
                blankspack1(),
                Container(
                  margin: EdgeInsets.only(
                    top: h * 0.2,
                  ),
                  height: h * 0.8,
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
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'ช่องทางติดต่อ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 250,
                        child: ElevatedButton.icon(
                          onPressed: (() {}),
                          icon: Icon(Icons.phone),
                          label: Text(
                            '087-087-9696',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(9, 59, 158, 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 200,
                        child: ElevatedButton.icon(
                          onPressed: (() {}),
                          icon: SvgPicture.asset('assets/svgassets/line.svg'),
                          label: Text(
                            '@trendywash',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'ที่อยู่ติดต่อ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'บริษัท เออเบิ้นเวย์ จำกัด',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'เลขที่ 666 ถนนสมเด็จพระเจ้าตากสิน',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'แขวงบุคคโล เขตธนบุรี จังหวัด กรุงเทพมหานคร',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'รหัสไปรษณีย์ 10600',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 90,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: (() {}),
                          child: Text(
                            'ดูแผนที่',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 187, 169, 100),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(230, 249, 247, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            elevation: 0.3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'เวลาทำการ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                'วันจันทร์-วันเสาร์',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'เวลา 09.00 - 18.00 น.',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                '(หยุดทุกวันอาทิตย์ และ วันหยุดนักขัดฤกษ์)',
                                style: TextStyle(
                                  color: Color.fromRGBO(184, 184, 184, 100),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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
