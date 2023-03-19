import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/login/loginpage.dart';
import 'package:trendy_mobile_1/homepage/register/registerotp.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

class registerpage2 extends StatelessWidget {
  const registerpage2(
      {super.key, required this.graphQLClient, required this.verificationId});
  final ValueNotifier<GraphQLClient> graphQLClient;
  final String? verificationId;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'LineseedsanRg',
      ),
      home: regis2Page(
        title: 'Flutter Demo Home Page',
        client: graphQLClient,
        verification: verificationId,
      ),
    );
  }
}

class regis2Page extends StatefulWidget {
  const regis2Page(
      {super.key,
      required this.title,
      required this.client,
      required this.verification});
  final String? verification;
  final ValueNotifier<GraphQLClient> client;
  final String title;

  @override
  State<regis2Page> createState() => _regis2PageState(
        passClient: client,
        passVerifacation: verification,
      );
}

class _regis2PageState extends State<regis2Page> {
  _regis2PageState({required this.passClient, required this.passVerifacation});
  final String? passVerifacation;
  final ValueNotifier<GraphQLClient> passClient;
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
    double w = displayWidth(context);
    return Container(
      margin: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          border: Border.all(width: 1.2, color: Colors.cyanAccent),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: _textpassword,
    );
  }

  Widget showlogo() {
    double h = displayHeight(context);
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: h * 0.05),
      //width: 150,
      //height: 150,
      child: Column(
        children: [Image.asset('assets/images/logo.png')],
      ),
    );
  }

  Widget textshowlogin() {
    double h = displayHeight(context);
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'สมัครสมาชิก',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Container(
            child: Text(
              'ตั้งรหัสผ่านของท่าน',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  Widget textandbutton() {
    double w = displayWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('มีบัญชีอยู่แล้ว?'),
        ),
        SizedBox(
          width: w * 0.03,
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
                      child: loginpage(
                        graphQLClient: passClient,
                      ),
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
                            child: registerpageotp(
                              graphQLClient: passClient,
                              verificationId: passVerifacation,
                            ),
                            type: PageTransitionType.rightToLeft));
                  }),
                  child: Text(
                    'ถัดไป',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(9, 59, 158, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              textandbutton(),
            ],
          ),
        ),
      ),
    );
  }
}
