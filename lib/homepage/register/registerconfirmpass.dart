import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/bottomNavbar.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/login/loginpage.dart';
import 'package:trendy_mobile_1/homepage/register/registerotp.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

class registerConfirmPasspage extends StatelessWidget {
  const registerConfirmPasspage(
      {super.key,
      required this.graphQLClient,
      required this.passPhoneControl,
      required this.passwordControl});
  final ValueNotifier<GraphQLClient> graphQLClient;

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
      required this.passcontrol,
      required this.Password});

  final ValueNotifier<GraphQLClient> client;
  final String title;
  final TextEditingController passcontrol;
  final TextEditingController Password;

  @override
  State<regisConfirmPassPage> createState() => _regisConfirmPassPageState(
        passClient: client,
        phoneController: passcontrol,
        usedPassword: Password,
      );
}

class _regisConfirmPassPageState extends State<regisConfirmPassPage> {
  _regisConfirmPassPageState(
      {required this.passClient,
      required this.phoneController,
      required this.usedPassword});

  final ValueNotifier<GraphQLClient> passClient;
  final TextEditingController phoneController;
  final TextEditingController usedPassword;
  TextEditingController ConfirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget confirmpasswordinput() {
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

  Widget textshowregistercomplete() {
    double h = displayHeight(context);
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'สมัครสมาชิกเสร็จสิ้น',
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
              'กรุณากดปุ่มเพื่อเข้าสู่หน้าหลัก',
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
                textshowregistercomplete(),
                SizedBox(
                  height: h * 0.12,
                ),
                Container(
                  width: w * 0.8,
                  height: h * 0.06,
                  child: ElevatedButton(
                    onPressed: (() {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: bottomNavbar(
                                graphQLClient: passClient,
                              ),
                              type: PageTransitionType.rightToLeft));
                    }),
                    child: Text(
                      'หน้าหลัก',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
