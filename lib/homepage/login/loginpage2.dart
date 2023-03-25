import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/bottomNavbar.dart';

import 'package:trendy_mobile_1/homepage/register/register.dart';

import '../size_helper.dart';

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

class loginpage2 extends StatelessWidget {
  const loginpage2(
      {super.key, required this.graphQLClient, required this.phoneControl});
  final ValueNotifier<GraphQLClient> graphQLClient;
  final TextEditingController phoneControl;
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: clientUser,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: log2Page(
          title: 'Flutter Demo Home Page',
          client: graphQLClient,
          passphControl: phoneControl,
        ),
      ),
    );
  }
}

class log2Page extends StatefulWidget {
  const log2Page(
      {super.key,
      required this.title,
      required this.client,
      required this.passphControl});
  final ValueNotifier<GraphQLClient> client;
  final String title;
  final TextEditingController passphControl;
  @override
  State<log2Page> createState() => _log2PageState(
        passClient: client,
        PhoneController: passphControl,
      );
}

class _log2PageState extends State<log2Page> {
  _log2PageState({required this.passClient, required this.PhoneController});
  final ValueNotifier<GraphQLClient> passClient;
  final TextEditingController PhoneController;
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordLoginController = TextEditingController();
  String LoginPhoneMutation = '''
mutation  loginPhone(
    \$tel: String!
    \$password: String!
  ){ 
    loginPhone(
    tel: \$tel
    password:\$password
    ){
      id
    }
    
  }
''';

  Widget passwordinput() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
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
        controller: passwordLoginController,
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
                Mutation(
                  options: MutationOptions(
                    document: gql(LoginPhoneMutation),
                    onError: (error) {
                      print(error);
                    },
                    onCompleted: (dynamic resultData) {
                      print(resultData);
                    },
                  ),
                  builder: (RunMutation runMutation, QueryResult? result) {
                    return Container(
                      width: w * 0.8,
                      height: h * 0.06,
                      child: ElevatedButton(
                        onPressed: (() {
                          if (_formKey.currentState!.validate()) {
                            if (passwordLoginController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('โปรดใส่รหัสผ่านของคุณ'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              runMutation(
                                {
                                  'tel': PhoneController.text,
                                  'password': passwordLoginController.text,
                                },
                              );
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: bottomNavbar(
                                        graphQLClient: passClient,
                                      ),
                                      type: PageTransitionType.rightToLeft));
                            }
                          }
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
                    );
                  },
                ),
                SizedBox(
                  height: h * 0.04,
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
