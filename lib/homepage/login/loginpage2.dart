import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/bottomNavbar.dart';

import 'package:trendy_mobile_1/homepage/register/register.dart';

import '../size_helper.dart';

class loginpage2 extends StatelessWidget {
  const loginpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextFormField _textpassword = new TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'กรุณาตั้งรหัสผ่าน';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10), border: InputBorder.none),
    keyboardType: TextInputType.text,
    autocorrect: false,
  );

  Widget passwordinput() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          border: Border.all(width: 1.2, color: Colors.cyanAccent),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: _textpassword,
    );
  }

  Widget showlogo() {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: 50),
      //width: 150,
      //height: 150,
      child: Column(
        children: [Image.asset('assets/images/logo.png')],
      ),
    );
  }

  Widget textshowlogin() {
    double h = displayHeight(context);
    return Column(
      children: [
        const Center(
          child: Text(
            'เข้าสู่ระบบ',
            style: TextStyle(
              fontFamily: 'LineseedsanBd',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: h * 0.03,
        ),
        Container(
          child: const Text(
            'กรอกรหัสผ่านของท่าน',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'LineseedsanRg',
            ),
          ),
        )
      ],
    );
  }

  Widget textandbutton() {
    double w = displayWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'ยังไม่มีบัญชี?',
          style: TextStyle(
            fontFamily: 'LineseedsanRg',
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: w * 0.03,
        ),
        Container(
          child: ElevatedButton(
            child: Text(
              'สมัครสมาชิก',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 187, 169, 100),
                fontFamily: 'LineseedsanBd',
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: registerpage(),
                      type: PageTransitionType.rightToLeft));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(217, 245, 242, 100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);
    double h = displayHeight(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showlogo(),
              SizedBox(
                height: h * 0.02,
              ),
              textshowlogin(),
              SizedBox(
                height: h * 0.1,
              ),
              passwordinput(),
              SizedBox(
                height: h * 0.12,
              ),
              Container(
                width: w * 0.8,
                height: h * 0.06,
                child: ElevatedButton(
                  onPressed: (() {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const bottomNavbar(),
                            type: PageTransitionType.rightToLeft));
                  }),
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'LineseedsanBd',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(9, 59, 158, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              textandbutton(),
            ],
          ),
        ),
      ),
    );
  }
}
