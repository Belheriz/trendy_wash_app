import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/bottomNavbar.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/login/loginpage.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

class registerpageotp extends StatelessWidget {
  const registerpageotp(
      {super.key, required this.graphQLClient, required this.verificationId});
  final ValueNotifier<GraphQLClient> graphQLClient;
  final String verificationId;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'LineseedsanRg',
      ),
      home: regisOtpPage(
        title: 'Flutter Demo Home Page',
        client: graphQLClient,
        passVerification: verificationId,
      ),
    );
  }
}

class regisOtpPage extends StatefulWidget {
  const regisOtpPage(
      {super.key,
      required this.title,
      required this.client,
      required this.passVerification});
  final ValueNotifier<GraphQLClient> client;
  final String title;
  final String passVerification;

  @override
  State<regisOtpPage> createState() => _RegisOtpPageState(
        passClient: client,
        useVerificationId: passVerification,
      );
}

class _RegisOtpPageState extends State<regisOtpPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _otpSent = false;

  _RegisOtpPageState(
      {required this.passClient, required this.useVerificationId});
  final String useVerificationId;
  final ValueNotifier<GraphQLClient> passClient;
  TextEditingController otpController = TextEditingController();
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

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  StreamController<int> _otpTimerController = StreamController<int>();

  void _startTimer() {
    const oneSecond = const Duration(seconds: 1);
    int remainingSeconds = 30;
    Timer.periodic(
      oneSecond,
      (Timer timer) {
        remainingSeconds--;
        if (remainingSeconds <= 0) {
          timer.cancel();
          _otpTimerController.add(-1); // signal that the timer has ended
        } else {
          _otpTimerController.add(remainingSeconds);
        }
      },
    );
  }

  Widget otPinput() {
    double w = displayWidth(context);
    return Container(
      margin: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          border: Border.all(width: 1.2, color: Colors.cyanAccent),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: TextFormField(
        controller: otpController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'กรุณาตั้งรหัสผ่าน';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10), border: InputBorder.none),
        keyboardType: TextInputType.numberWithOptions(),
        autocorrect: false,
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
              'กรุณาใส่ otp ของท่าน',
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

  /*Widget textshowNameSurname() {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Container(
            alignment: FractionalOffset.topLeft,
            width: 50,
            height: 30,
            child: Row(
              children: [Image.asset('assets/images/green-person.png')],
            ),
          ),
          SizedBox(
            width: 0,
            height: 0,
          ),
          Container(
            child: Text(
              'ชื่อ-สกุล เกษตรกร',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
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
              otPinput(),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: ((value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      }),
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: ((value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      }),
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: ((value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      }),
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: ((value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      }),
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),*/

              StreamBuilder<int>(
                stream: _otpTimerController.stream,
                initialData: 30,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.data == -1) {
                    return ElevatedButton(
                      onPressed: () {
                        // Code to resend the OTP
                      },
                      child: Text('Resend OTP'),
                    );
                  } else {
                    return Text('Remaining time: ${snapshot.data}');
                  }
                },
              ),
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
                        verificationId: useVerificationId,
                        smsCode: otpController.text,
                      );
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      // Navigate to the home page.
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: bottomNavbar(
                                graphQLClient: passClient,
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
                    'เสร็จสิ้น',
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
