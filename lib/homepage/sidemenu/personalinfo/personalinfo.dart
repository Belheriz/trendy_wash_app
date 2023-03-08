import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

class personalinfo extends StatelessWidget {
  const personalinfo({super.key});
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: blue,
        fontFamily: 'LineseedsanRg',
      ),
      home: const _Personalinfo(),
    );
  }
}

class _Personalinfo extends StatefulWidget {
  const _Personalinfo({
    super.key,
  });

  @override
  State<_Personalinfo> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_Personalinfo> {
  bool facebookValue = true;
  bool lineValue = true;
  bool googleValue = true;

  Widget profilebanner() {
    double w = displayWidth(context);
    double h = displayHeight(context);
    return Container(
      width: w * 0.4,
      height: h * 0.04,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xffA94F2E),
            Color(0xffD98A5D),
            Color(0xffB15530),
            Color(0xffC06035),
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            const Text(
              'Bronze Member',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textshowname() {
    double w = displayWidth(context);
    double h = displayHeight(context);
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: w * 0.5),
            child: Text(
              'ชื่อ - นามสกุลผู้ใช้',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: h * 0.03,
          ),
          Container(
            margin: EdgeInsets.only(right: w * 0.1),
            child: Text(
              'First name    Last name',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget telephoneinput() {
    double w = displayWidth(context);
    double h = displayHeight(context);
    TextFormField _textphone = TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'กรุณาเบอร์โทรศัพท์';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10), border: InputBorder.none),
      keyboardType: TextInputType.phone,
      autocorrect: false,
    );
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: w * 0.6),
            child: const Text(
              'เบอร์โทรศัพท์',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Container(
            margin: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 240, 240),
                border: Border.all(width: 1.2, color: Colors.cyanAccent),
                borderRadius: const BorderRadius.all(Radius.circular(18))),
            child: _textphone,
          ),
        ],
      ),
    );
  }

  Widget emailinput() {
    double w = displayWidth(context);
    double h = displayHeight(context);
    TextFormField _textemail = TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'กรุณาเบอร์โทรศัพท์';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10), border: InputBorder.none),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
    );
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: w * 0.75),
            child: const Text(
              'อีเมล',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Container(
            margin: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                border: Border.all(width: 1.2, color: Colors.cyanAccent),
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: _textemail,
          ),
        ],
      ),
    );
  }

  Widget switchAccout() {
    String imageFacebook = 'assets/images/facebook1.png';
    String imageLine = 'assets/images/line.png';
    String imageGoogle = 'assets/images/google.png';
    double w = displayWidth(context);
    double h = displayHeight(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: w * 0.5),
          child: Text(
            'บัญชีอื่นๆ ที่เชื่อมต่อ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: h * 0.01,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: w * 0.15),
              child: Image.asset(imageFacebook),
            ),
            Container(
              margin: EdgeInsets.only(left: w * 0.04),
              child: Text(
                'Facebook',
                style: TextStyle(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: w * 0.35,
              ),
              child: Transform.scale(
                scale: 1,
                child: CupertinoSwitch(
                  value: facebookValue,
                  onChanged: ((value) => setState(
                        () => this.facebookValue = value,
                      )),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: w * 0.13),
              child: Image.asset(imageLine),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: const Text(
                'Line',
                style: TextStyle(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: w * 0.42,
              ),
              child: Transform.scale(
                scale: 1,
                child: CupertinoSwitch(
                  value: lineValue,
                  onChanged: ((value) => setState(
                        () => this.lineValue = value,
                      )),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: w * 0.13),
              child: Image.asset(imageGoogle),
            ),
            Container(
              margin: EdgeInsets.only(left: 13),
              child: const Text(
                'Google',
                style: TextStyle(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: w * 0.38,
              ),
              child: Transform.scale(
                scale: 1,
                child: CupertinoSwitch(
                  value: googleValue,
                  onChanged: ((value) => setState(
                        () => this.googleValue = value,
                      )),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);
    double h = displayHeight(context) -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    double he = displayHeight(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();

            Navigator.push(
              context,
              PageTransition(
                child: homepage(),
                type: PageTransitionType.leftToRight,
              ),
            );
          },
        ),
        title: Text(
          'ข้อมูลส่วนตัว',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: h * 0.1,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff093B9E),
                          Color(0xff0578A3),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: h * 0.03),
                    child: const Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xffA94F2E),
                        child: CircleAvatar(
                          radius: 38,
                          backgroundImage:
                              AssetImage('assets/images/exprofile.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: he * 0.02,
            ),
            profilebanner(),
            SizedBox(
              height: he * 0.04,
            ),
            textshowname(),
            SizedBox(
              height: he * 0.02,
            ),
            telephoneinput(),
            emailinput(),
            SizedBox(
              height: he * 0.02,
            ),
            switchAccout(),
            SizedBox(
              height: he * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: (() {}),
                    child: Text(
                      'บันทึก',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(9, 59, 158, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                SizedBox(
                  width: w * 0.08,
                ),
                Container(
                  height: 45,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: (() {}),
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 225, 203, 100),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(217, 245, 242, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
