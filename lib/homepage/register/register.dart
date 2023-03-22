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
  final _formKey = GlobalKey<FormState>();
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
          }
          if (value.length != 10) {
            return 'เบอร์โทรศัพท์ไม่ถูกต้อง';
          }
          if (!RegExp(r'^\d{10}$').hasMatch(value)) {
            return 'เบอร์โทรศัพท์ไม่ถูกต้องกรุณาใส่ใหม่';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10), border: InputBorder.none),
        keyboardType: TextInputType.phone,
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
        body: Form(
          key: _formKey,
          child: Center(
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
                      if (_formKey.currentState!.validate()) {
                        if (phoneController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('โปรดใส่เบอร์โทรศัพท์ของคุณ'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '+66${phoneController.text}',
                            verificationCompleted:
                                (PhoneAuthCredential credential) async {
                              // Auto-retrieve the SMS code on Android devices.
                              await FirebaseAuth.instance
                                  .signInWithCredential(credential);
                            },
                            verificationFailed: (FirebaseAuthException e) {
                              if (e.code == 'invalid-phone-number') {
                                print(
                                    'The provided phone number is not valid.');
                              }
                            },
                            codeSent:
                                (String verificationId, int? resendToken) {
                              // Navigate to the second page to input OTP code.

                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: registerpage2(
                                        graphQLClient: passClient,
                                        verificationId: verificationId,
                                        passPhoneControl: phoneController,
                                      ),
                                      type: PageTransitionType.rightToLeft));
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        }
                      }
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
      ),
    );
  }
}
