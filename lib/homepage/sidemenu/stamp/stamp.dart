import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';

class stamppage extends StatelessWidget {
  const stamppage({super.key});
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
      home: const _Stamp(),
    );
  }
}

class _Stamp extends StatefulWidget {
  const _Stamp({
    super.key,
  });

  @override
  State<_Stamp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_Stamp> {
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
          'บัตรสะสมสแตมป์',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff0490B5),
                  Color(0xff093B9E),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              border: Border.all(
                width: 2,
                color: Color.fromRGBO(0, 187, 169, 20),
              ),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'TRENDY WASH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'AT ชัยมงคล สงขลา',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Container(
                    width: 260,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Image.asset('assets/images/logo1.png'),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Color(0xffB8B8B8),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: Color(0xffB8B8B8),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: Color(0xffB8B8B8),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '5',
                              style: TextStyle(
                                color: Color(0xffB8B8B8),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Container(
                    width: 260,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '6',
                              style: TextStyle(
                                color: Color(0xffB8B8B8),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '7',
                              style: TextStyle(
                                color: Color(0xffB8B8B8),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '8',
                              style: TextStyle(
                                color: Color(0xffB8B8B8),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '9',
                              style: TextStyle(
                                color: Color(0xffB8B8B8),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '10',
                              style: TextStyle(
                                color: Color(0xffB8B8B8),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              insetPadding: EdgeInsets.zero,
                              content: Column(
                                children: [
                                  Image.asset('assets/images/stamp1.png'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Text(
                                      'แลกแสตมป์สำเร็จ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Text(
                                      'คุณใช้แสตมป์ 20 ดวง',
                                      style: TextStyle(
                                        color: Color(0xff555555),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'แลกเครดิต 40฿ เรียบร้อย',
                                      style: TextStyle(
                                        color: Color(0xff555555),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 180,
                                    child: ElevatedButton(
                                      child: Text(
                                        'ดูบัตรสะสมแสตมป์',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff093B9E),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 180,
                                    child: ElevatedButton(
                                      child: Text(
                                        'กลับหน้าหลัก',
                                        style: TextStyle(
                                            color: Color(0xff00BBA9),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffD9F5F2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        },
                      );
                    },
                    child: Text(
                      'แลกแสตมป์ รับเครดิต 40฿',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00BBA9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Divider(
            color: Colors.grey,
          ),
          Align(
            alignment: Alignment(-0.9, 0),
            child: Text(
              'เงื่อนไขการแลกแสตมป์',
              style: TextStyle(
                color: Color(0xff9E9E9E),
                fontSize: 18,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.6, 0),
            child: Text(
              '- ทุกการซัก 1 ครั้งจะได้รับเเสตมป์ 1 ดวง',
              style: TextStyle(
                color: Color(0xff9E9E9E),
                fontSize: 16,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.74, 0),
            child: Text(
              '- สะสมครบ 10 ดวง รับเครติด 40฿',
              style: TextStyle(
                color: Color(0xff9E9E9E),
                fontSize: 16,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.7, 0),
            child: Text(
              '- บัตรสะสมคะแนน 1 ใบ สามารถแลกได้เพียง 1 ครั้ง',
              style: TextStyle(
                color: Color(0xff9E9E9E),
                fontSize: 16,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.45, 0),
            child: Text(
              '- สะสมแสตมป์และแลกของได้แล้วตั้งแต่วันนี้\nถึง 31 ธันวาคม 2660',
              style: TextStyle(
                color: Color(0xff9E9E9E),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
