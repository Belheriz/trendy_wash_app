import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';

class paymethpage extends StatelessWidget {
  const paymethpage({super.key});
  static const MaterialColor white = MaterialColor(
    whitePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(whitePrimaryValue),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
  static const int whitePrimaryValue = 0xFFFFFFFF;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
        fontFamily: 'LineseedsanRg',
      ),
      home: const Paymeth(),
    );
  }
}

class Paymeth extends StatefulWidget {
  const Paymeth({
    super.key,
  });

  @override
  State<Paymeth> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Paymeth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(
              context,
              PageTransition(
                child: homepage(),
                type: PageTransitionType.leftToRight,
              ),
            );
          },
        ),
        title: Text(
          'วิธีการชำระเงิน',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Image.asset('assets/images/paymeth01.png'),
            Text('1.เลือกช่องทางการชำระเงิน'),
            Image.asset('assets/images/paymeth02.png'),
            Text('2.เลือกจำนวนเงิน'),
            Image.asset('assets/images/paymeth03.png'),
            Text('3.ดูสถานะเครื่องว่างได้ผ่าน app'),
            Image.asset('assets/images/paymeth04.png'),
            Text('4.ยืนยันการทำงาน')
          ],
        ),
      ),
    );
  }
}
