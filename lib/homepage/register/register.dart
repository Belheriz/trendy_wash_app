import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/login/loginpage.dart';

import 'package:trendy_mobile_1/homepage/register/register.dart';
import 'package:trendy_mobile_1/homepage/register/register2.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

class registerpage extends StatelessWidget {
  const registerpage({super.key, required this.graphQLClient});
  final ValueNotifier<GraphQLClient> graphQLClient;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'LineseedsanRg',
      ),
      home: regisPage(
        title: 'Flutter Demo Home Page',
        client: graphQLClient,
      ),
    );
  }
}

class regisPage extends StatefulWidget {
  const regisPage({super.key, required this.title, required this.client});
  final ValueNotifier<GraphQLClient> client;
  final String title;

  @override
  State<regisPage> createState() => _regisPageState(passClient: client);
}

class _regisPageState extends State<regisPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  //
  TextEditingController phoneController = TextEditingController();
  //
  _regisPageState({required this.passClient});
  //
  final ValueNotifier<GraphQLClient> passClient;
  //
  String? _verificationId;

  requestVerifyCode() {
    _auth.verifyPhoneNumber(
        phoneNumber: "+66" + phoneController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: (firebaseUser) {
          //
        },
        verificationFailed: (error) {
          print(
              'Phone number verification failed. Code: ${error.code}. Message: ${error.message}');
        },
        codeSent: (verificationId, [forceResendingToken]) {
          setState(() {
            _verificationId = verificationId;
          });
          print(verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          //
        });
  }

  Widget phoneinput() {
    double w = displayWidth(context);
    return Container(
      margin: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          border: Border.all(width: 1.2, color: Colors.cyanAccent),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: TextFormField(
        controller: phoneController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'กรุณาใส่เบอร์โทรศัพท์ของท่าน';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10), border: InputBorder.none),
        keyboardType: TextInputType.text,
        autocorrect: false,
      ),
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
            height: h * 0.02,
          ),
          Container(
            child: Text(
              'กรอกเบอร์โทรศัพท์ของท่าน',
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
        key: scaffoldKey,
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
              phoneinput(),
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
                            child: registerpage2(
                              graphQLClient: passClient,
                              verificationId: _verificationId,
                            ),
                            type: PageTransitionType.rightToLeft));
                    requestVerifyCode();
                  }),
                  child: Text(
                    'ถัดไป',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
