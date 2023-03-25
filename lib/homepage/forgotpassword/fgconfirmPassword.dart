import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/login/loginpage2.dart';
import 'package:trendy_mobile_1/homepage/register/register.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

import '../login/loginpage.dart';

final HttpLink httpLinkUser = HttpLink(
  'http://api.graphql.trendywash.net:3001/graphql',
);

final Link linkUser = httpLinkUser;
ValueNotifier<GraphQLClient> clientUser = ValueNotifier(
  GraphQLClient(
    link: linkUser,
    cache: GraphQLCache(),
  ),
);

class fgconfirmPassword extends StatelessWidget {
  const fgconfirmPassword({
    super.key,
    required this.graphQLClient,
    required this.PhoneController,
    required this.resetPasswordController,
  });
  final ValueNotifier<GraphQLClient> graphQLClient;
  final TextEditingController PhoneController;
  final TextEditingController resetPasswordController;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: clientUser,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: fgconfirmPassPage(
          title: 'Flutter Demo Home Page',
          passClient: graphQLClient,
          passphControl: PhoneController,
          resetPassControl: resetPasswordController,
        ),
      ),
    );
  }
}

class fgconfirmPassPage extends StatefulWidget {
  const fgconfirmPassPage(
      {super.key,
      required this.title,
      required this.passClient,
      required this.passphControl,
      required this.resetPassControl});
  final ValueNotifier<GraphQLClient> passClient;
  final String title;
  final TextEditingController passphControl;
  final TextEditingController resetPassControl;
  @override
  State<fgconfirmPassPage> createState() => _fgconfirmPassPageState(
        usedClient: passClient,
        UsedPhoneController: passphControl,
        UsedresetPasswordController: resetPassControl,
      );
}

class _fgconfirmPassPageState extends State<fgconfirmPassPage> {
  _fgconfirmPassPageState({
    required this.usedClient,
    required this.UsedPhoneController,
    required this.UsedresetPasswordController,
  });
  final TextEditingController UsedPhoneController;
  final TextEditingController UsedresetPasswordController;
  final ValueNotifier<GraphQLClient> usedClient;
  final _formKey = GlobalKey<FormState>();
  TextEditingController confirmpasswordControl = TextEditingController();
  String forgotPasswordMutation = '''
  mutation forgotPasswordUser(
    \$tel: String!
    \$password: String!
    \$confirmPassword: String!
    
  ) {
    forgotPasswordUser(
      tel: \$tel
      password: \$password
      confirmPassword: \$confirmPassword
      ){
        id
      }
     
  }
''';

  Widget confirmresetPasswordinput() {
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
            return 'กรุณาใส่รหัสผ่านให้ถูกต้อง';
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
        controller: confirmpasswordControl,
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
              'กรุณาใส่รหัสผ่านของคุณอีกครั้ง',
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
                confirmresetPasswordinput(),
                SizedBox(
                  height: h * 0.12,
                ),
                Mutation(
                  options:
                      MutationOptions(document: gql(forgotPasswordMutation)),
                  builder: (RunMutation runMutation, QueryResult? result) {
                    return Container(
                      width: w * 0.8,
                      height: h * 0.06,
                      child: ElevatedButton(
                        onPressed: (() {
                          runMutation({
                            'tel': UsedPhoneController.text,
                            'password': UsedresetPasswordController.text,
                            'confirmPassword': confirmpasswordControl.text,
                          });
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: loginpage(
                                    graphQLClient: usedClient,
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
                    );
                  },
                ),

                SizedBox(
                  height: h * 0.04,
                ),
                //textandbutton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
