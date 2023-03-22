import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/forgotpassword/FgnumberInput.dart';
import 'package:trendy_mobile_1/homepage/login/loginpage2.dart';
import 'package:trendy_mobile_1/homepage/register/register.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

class loginpage extends StatelessWidget {
  const loginpage({super.key, required this.graphQLClient});
  final ValueNotifier<GraphQLClient> graphQLClient;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: logPage(
        title: 'Flutter Demo Home Page',
        client: graphQLClient,
      ),
    );
  }
}

class logPage extends StatefulWidget {
  const logPage({super.key, required this.title, required this.client});
  final ValueNotifier<GraphQLClient> client;
  final String title;

  @override
  State<logPage> createState() => _logPageState(passClient: client);
}

class _logPageState extends State<logPage> {
  _logPageState({required this.passClient});
  final ValueNotifier<GraphQLClient> passClient;
  TextFormField _textphone = new TextFormField(
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
  );

  Widget phoneinput() {
    double w = displayWidth(context);
    return Container(
      margin: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          border: Border.all(width: 1.2, color: Colors.cyanAccent),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: _textphone,
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
              'เข้าสู่ระบบ',
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
              'กรอกเบอร์โทรศัพท์ของท่าน',
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

  Widget textandbutton() {
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
                      child: registerpage(
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

  Widget forgotandbutton() {
    double w = displayWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            'ลืมรหัสผ่าน?',
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
              'กดที่นี่เพื่อรีเซ็ตรหัสผ่าน',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontFamily: 'LineseedsanBd',
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: fgNumberinput(
                        graphQLClient: passClient,
                      ),
                      type: PageTransitionType.rightToLeft));
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
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
              phoneinput(),
              SizedBox(
                height: h * 0.1,
              ),
              Container(
                width: w * 0.8,
                height: h * 0.06,
                child: ElevatedButton(
                  onPressed: (() {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: loginpage2(
                              graphQLClient: passClient,
                            ),
                            type: PageTransitionType.rightToLeft));
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
              textandbutton(),
              SizedBox(
                height: h * 0.001,
              ),
              forgotandbutton()
            ],
          ),
        ),
      ),
    );
  }
}
