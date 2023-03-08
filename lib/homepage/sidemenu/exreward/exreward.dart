import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/exreward/exrewardpage2.dart';
import '../../size_helper.dart';
import 'exrewardmodel.dart';

class exreward extends StatelessWidget {
  const exreward({super.key});
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
      home: const Exreward(),
    );
  }
}

class Exreward extends StatefulWidget {
  const Exreward({
    super.key,
  });

  @override
  State<Exreward> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Exreward> {
  List<exrewardmodel> Expoint = [
    exrewardmodel(
        detail: 'น้ำยาปรับผ้านุ่ม Fresh & Soft Still All day 12 ซอง',
        images: 'assets/images/Exreward1.png',
        expired: '10 ต.ค.- 30 ธ.ค. 65'),
    exrewardmodel(
      detail: 'พอยท์ แลก E-Coupon มูลค่า 50 บาท',
      images: 'assets/images/Exreward2.png',
      expired: '10 ต.ค.- 30 ธ.ค. 65',
    ),
    exrewardmodel(
      detail: 'น้ำยาปรับผ้านุ่ม Fresh & Soft Cool Relax 12 ซอง',
      images: 'assets/images/Exreward3.png',
      expired: '10 ต.ค.- 30 ธ.ค. 65',
    )
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(he * 0.3),
            child: AppBar(
              toolbarHeight: he * 0.03,
              leading: BackButton(
                color: Colors.white,
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
              flexibleSpace: Container(
                height: he * 0.28,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff093B9E),
                      Color(0xff00BBA9),
                    ],
                    stops: [-2, 7],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: w * 0.11,
                        top: he * 0.15,
                        right: w * 0.1,
                      ),
                      height: he * 0.2,
                      width: w * 0.8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: w * 0.1,
                              top: he * 0.01,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'พอยท์สะสม',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: he * 0.01,
                                ),
                                Center(
                                  child: Text(
                                    '100',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff00BBA9),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: he * 0.01, left: w * 0.2),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'ยอดเงิน',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: he * 0.01,
                                ),
                                Center(
                                  child: Text(
                                    '350',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff00BBA9),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(
                'แลกรางวัล',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              elevation: 0,
              bottom: TabBar(tabs: [
                Tab(
                  text: 'พอยท์แลกรางวัล',
                ),
                Tab(
                  text: 'เงินแลกรางวัล',
                ),
              ]),
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemCount: Expoint.length,
                  itemBuilder: (BuildContext context, int index) {
                    exrewardmodel expoint = Expoint[index];
                    return ListTile(
                      leading: Container(
                        height: 80,
                        width: 120,
                        child: Image.asset(expoint.images),
                      ),
                      title: Align(
                        alignment: Alignment(5, 6),
                        child: Text(
                          expoint.detail,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Container(
                        child: Column(children: [
                          Align(
                            alignment: Alignment(-1, 0),
                            child: Text(
                              expoint.expired,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            width: 260,
                            margin: EdgeInsets.only(right: 15),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => rewardresult()),
                                );
                              },
                              child: Text(
                                'แลก 50 คะแนน',
                                style: TextStyle(
                                    color: Color(0xff00BBA9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffD9F5F2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                ),
                              ),
                            ),
                          )
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
