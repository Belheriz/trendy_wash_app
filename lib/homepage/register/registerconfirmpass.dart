import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/login/loginpage.dart';
import 'package:trendy_mobile_1/homepage/register/registerotp.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

class registerConfirmPasspage extends StatelessWidget {
  const registerConfirmPasspage(
      {super.key,
      required this.graphQLClient,
      required this.verificationId,
      required this.passPhoneControl,
      required this.passwordControl});
  final ValueNotifier<GraphQLClient> graphQLClient;
  final String verificationId;
  final TextEditingController passPhoneControl;
  final TextEditingController passwordControl;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'LineseedsanRg',
      ),
      home: regisConfirmPassPage(
        title: 'Flutter Demo Home Page',
        client: graphQLClient,
        verification: verificationId,
        passcontrol: passPhoneControl,
        Password: passwordControl,
      ),
    );
  }
}

class regisConfirmPassPage extends StatefulWidget {
  const regisConfirmPassPage(
      {super.key,
      required this.title,
      required this.client,
      required this.verification,
      required this.passcontrol,
      required this.Password});
  final String verification;
  final ValueNotifier<GraphQLClient> client;
  final String title;
  final TextEditingController passcontrol;
  final TextEditingController Password;

  @override
  State<regisConfirmPassPage> createState() => _regisConfirmPassPageState(
        passClient: client,
        passVerifacation: verification,
        phoneController: passcontrol,
        usedPassword: Password,
      );
}

class _regisConfirmPassPageState extends State<regisConfirmPassPage> {
  _regisConfirmPassPageState(
      {required this.passClient,
      required this.passVerifacation,
      required this.phoneController,
      required this.usedPassword});
  final String passVerifacation;
  final ValueNotifier<GraphQLClient> passClient;
  final TextEditingController phoneController;
  final TextEditingController usedPassword;
  TextEditingController ConfirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget passwordinput() {
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
            return 'กรุณาตั้งรหัสผ่าน';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10), border: InputBorder.none),
        keyboardType: TextInputType.text,
        autocorrect: false,
        controller: ConfirmpasswordController,
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
              'กรุณาใส่รหัสผ่านของท่านอีกครั้งเพื่อยืนยัน',
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
                passwordinput(),
                SizedBox(
                  height: h * 0.12,
                ),
                Container(
                  width: w * 0.8,
                  height: h * 0.06,
                  child: ElevatedButton(
                    onPressed: (() {
                      if (_formKey.currentState!.validate()) {
                        if (ConfirmpasswordController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('โปรดใส่รหัสผ่านของคุณ'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else if (usedPassword.text !=
                            ConfirmpasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('รหัสผ่านของคุณไม่ถูกต้อง'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: registerpageotp(
                                    graphQLClient: passClient,
                                    verificationId: passVerifacation,
                                    passPhController: phoneController,
                                    passwordControl: usedPassword,
                                    confirmpasswordControl:
                                        ConfirmpasswordController,
                                  ),
                                  type: PageTransitionType.rightToLeft));
                        }
                      }
                    }),
                    child: Text(
                      'ถัดไป',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
