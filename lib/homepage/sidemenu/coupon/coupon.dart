import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';
import 'Couponmodel.dart';

class couponpage extends StatelessWidget {
  const couponpage({super.key});
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
      home: const Coupon(),
    );
  }
}

class Coupon extends StatefulWidget {
  const Coupon({
    super.key,
  });

  @override
  State<Coupon> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Coupon> {
  List<couponmodel> Couponmodel = [
    couponmodel(
        detail: 'พิเศษเฉพาะสามชิกใหม่',
        discount: 'ลดทันที 20%',
        expired: 'หมดอายุ 30 ธ.ค. 2566'),
    couponmodel(
        detail: 'ยอดใช้งานสะสม 500 บาท',
        discount: 'รับส่วนลด 50 บาท',
        expired: 'หมดอายุ 30 ธ.ค. 2566'),
    couponmodel(
        detail: 'ยอดใช้งานสะสม 100 บาท',
        discount: 'รับส่วนลด 150 บาท',
        expired: 'หมดอายุ 30 ธ.ค. 2566'),
  ];
  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);
    double h = displayHeight(context) -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    double he = displayHeight(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              'เก็บคูปอง',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            bottom: TabBar(tabs: [
              Tab(
                text: 'คูปองทั้งหมด',
              ),
              Tab(
                text: 'คูปองสะสม',
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemCount: Couponmodel.length,
                  itemBuilder: (BuildContext context, int index) {
                    couponmodel coupon = Couponmodel[index];
                    return ListTile(
                      title: Text(
                        coupon.detail,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'เก็บคูปอง',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 187, 169, 100),
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(217, 245, 242, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                      ),
                      subtitle: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  coupon.discount,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  coupon.expired,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  }),
              Center(
                child: Text('Page 2'),
              ),
            ],
          )),
    );
  }
}
