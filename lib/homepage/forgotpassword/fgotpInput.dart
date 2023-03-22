import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/forgotpassword/fgresetPassword.dart';
import 'package:trendy_mobile_1/homepage/login/loginpage2.dart';
import 'package:trendy_mobile_1/homepage/register/register.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

class fgotpinput extends StatelessWidget {
  const fgotpinput(
      {super.key, required this.graphQLClient, required this.verificationId});
  final ValueNotifier<GraphQLClient> graphQLClient;
  final String verificationId;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: fgotpPage(
        title: 'Flutter Demo Home Page',
        passClient: graphQLClient,
        passVerification: verificationId,
      ),
    );
  }
}

class fgotpPage extends StatefulWidget {
  const fgotpPage(
      {super.key,
      required this.title,
      required this.passClient,
      required this.passVerification});
  final ValueNotifier<GraphQLClient> passClient;
  final String title;
  final String passVerification;
  @override
  State<fgotpPage> createState() => _fgotpPageState(
        usedClient: passClient,
        usedVerification: passVerification,
      );
}

class _fgotpPageState extends State<fgotpPage> {
  _fgotpPageState({
    required this.usedClient,
    required this.usedVerification,
  });
  final ValueNotifier<GraphQLClient> usedClient;
  final String usedVerification;
  TextEditingController otpController = TextEditingController();
  Widget phoneinput() {
    double w = displayWidth(context);
    return Container(
      margin: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          border: Border.all(width: 1.2, color: Colors.cyanAccent),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'กรุณาเบอร์โทรศัพท์';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.phone,
        autocorrect: false,
        controller: otpController,
      ),
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
          Center(
            child: Text(
              'รีเซ็ตรหัสผ่าน',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LineseedsanBd'),
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Container(
            child: Text(
              'กรุณากรอก OTP ของท่าน',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'LineseedsanRg',
              ),
            ),
          )
        ],
      ),
    );
  }

  /*Widget textandbutton() {
    double w = displayWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            'ยังไม่มีบัญชี?',
            style: TextStyle(
              fontFamily: 'LineseedsanRg',
            ),
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
  }*/

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
              phoneinput(),
              SizedBox(
                height: h * 0.12,
              ),
              Container(
                width: w * 0.8,
                height: h * 0.06,
                child: ElevatedButton(
                  onPressed: (() async {
                    try {
                      final credential = PhoneAuthProvider.credential(
                        verificationId: usedVerification,
                        smsCode: otpController.text,
                      );
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      // Navigate to the home page.
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: fgresetPassword(
                                graphQLClient: usedClient,
                              ),
                              type: PageTransitionType.rightToLeft));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-verification-code') {
                        // Display a notification for incorrect OTP code.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('OTP ไม่ถูกต้อง'),
                          ),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                  }),
                  child: Text(
                    'ถัดไป',
                    style: TextStyle(
                      fontFamily: 'LineseedsanBd',
                      fontSize: 16,
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
              //textandbutton(),
            ],
          ),
        ),
      ),
    );
  }
}
