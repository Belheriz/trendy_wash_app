import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/promotion/promotionmodel.dart';
import 'package:trendy_mobile_1/homepage/promotion/prostamp.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/exreward/exrewardpage2.dart';

import '../notification/notification.dart';
import '../sidemenu/callcenter/callcenter.dart';
import '../sidemenu/coupon/coupon.dart';
import '../sidemenu/exreward/exreward.dart';
import '../sidemenu/history/history.dart';
import '../sidemenu/paymentmethod/paymentmethod.dart';
import '../sidemenu/personalinfo/personalinfo.dart';
import '../sidemenu/stamp/stamp.dart';

class promotionpage extends StatelessWidget {
  const promotionpage({super.key});
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
      home: const _promotion(),
    );
  }
}

class _promotion extends StatefulWidget {
  const _promotion({
    super.key,
  });

  @override
  State<_promotion> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_promotion> {
  List<promotionmodel> promotion = [
    promotionmodel(
      promotionname: 'โปรโมรชั่นพิเศษลดครึ่งราคา ซักอบ 5 วัน',
      images: 'assets/images/promotion1.png',
      date: '10 พฤศจิกายน 2022',
    ),
    promotionmodel(
      promotionname: 'ฉลองครบรอบ 15 ปี Trendy Wash',
      images: 'assets/images/promotion2.png',
      date: '10 พฤศจิกายน 2022',
    ),
    promotionmodel(
      promotionname: 'โปรโมรชั่นพิเศษสะสมแต้มแลกของรางวัล',
      images: 'assets/images/promotion3.png',
      date: '10 พฤศจิกายน 2022',
    ),
    promotionmodel(
      promotionname: 'โปรประจำเดือนกันยายนหน้าฝนนี้ทาง Trendy Wash',
      images: 'assets/images/promotion4.png',
      date: '10 พฤศจิกายน 2022',
    ),
  ];

  List<prostampmodel> prostamp = [
    prostampmodel(
        prostampname: 'จ่ายผ่านแอพถูกกว่าซัก 5 ครั้ง รับฟรีเครดิต 20฿',
        images: 'assets/images/promotion4.png',
        date: '30 พฤศจิกายน 2022')
  ];

  TextFormField _textsearch = new TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'กรุณาตั้งรหัสผ่าน';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        border: InputBorder.none,
        hintText: 'ค้นหาโปรโมชั่น'),
    keyboardType: TextInputType.text,
    autocorrect: false,
  );

  Widget searchinput() {
    return Container(
      width: 260,
      height: 40,
      margin: EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
          color: Color(0xffF4F6F9),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: _textsearch,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.0),
            child: AppBar(
              toolbarHeight: 60,
              flexibleSpace: Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xffF4F6F9),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [searchinput()],
                ),
              ),
              title: Image.asset('assets/images/logo.png'),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: notification(),
                              type: PageTransitionType.rightToLeft));
                    }),
                    icon: Icon(
                      Icons.ring_volume,
                      color: Color.fromRGBO(9, 59, 157, 20),
                    ))
              ],
              elevation: 0,
              bottom: TabBar(tabs: [
                Tab(
                  text: 'โปรโมชั่นล่าสุด',
                ),
                Tab(
                  text: 'สะสมแสตมป์',
                ),
              ]),
            ),
          ),
          drawer: const NavigationDrawer(),
          body: TabBarView(
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: promotion.length,
                  itemBuilder: (BuildContext context, int index) {
                    promotionmodel promotionlist = promotion[index];
                    return ListTile(
                      leading: Container(
                        height: 80,
                        width: 120,
                        child: Image.asset(promotionlist.images),
                      ),
                      title: Align(
                        alignment: Alignment(5, 6),
                        child: Text(
                          promotionlist.promotionname,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) => Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              'โปรประจำเดือนกันยายนหน้าฝนนี้\nทาง Trendy Wash',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Image.asset(
                                                'assets/images/upcursor2.png')
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.95, 0),
                                        child: Text(
                                          '10 พฤศจิกายน 2022',
                                          style: TextStyle(
                                            color: Color(0xff00BBA9),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset(
                                        'assets/images/pro4max.png',
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment(-0.5, 0),
                                        child: Text(
                                          ' ชวนทุกคนมาอบผ้ากันเพราะการตากผ้าไม่แห้ง\nเสี่ยงต่อกลิ่นอับเเละเชื้อโรค',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.6, 0),
                                        child: Text(
                                          ' เพียงอบผ้าครบ 5 ครั้ง รับฟรีเครดิตทันที\n20 บาทภายในวันที่ 1-30 ก.ย. 64 เท่านั้น',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment(-0.8, 0),
                                        child: Text(
                                          'เงื่อนไข',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.7, 0),
                                        child: Text(
                                          '-อบขั้นต่ำ 40 บาท ต่อครั้ง',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.6, 0),
                                        child: Text(
                                          '-ใช้งานผ่านapp Trendy wash เท่านั้น',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.7, 0),
                                        child: Text(
                                          '-เฉพาะสาขาที่ร่วมรายการ',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment(-0.7, 0),
                                        child: Text(
                                          'สาขาที่ร่วมรายการจะมีภาพแสดงโปรนี้ในหน้าapp สาขา',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 250,
                                        height: 40,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'ดูรายละเอียดเพิ่มเติม',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff093B9E),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                      },
                      subtitle: Container(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                promotionlist.date,
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff00BBA9)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: prostamp.length,
                  itemBuilder: (BuildContext context, int index) {
                    prostampmodel prostamplist = prostamp[index];
                    return ListTile(
                      leading: Container(
                        height: 80,
                        width: 120,
                        child: Image.asset(prostamplist.images),
                      ),
                      title: Align(
                        alignment: Alignment(5, 6),
                        child: Text(
                          prostamplist.prostampname,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Container(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                prostamplist.date,
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff00BBA9)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          )),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  final String svghistory = 'assets/svgassets/history1.svg';
  final String svgstamp = 'assets/svgassets/stamp1.svg';
  final String svgcoupon = 'assets/svgassets/coupon.svg';
  final String svgwallet = 'assets/svgassets/wallet1.svg';
  final String svgchat = 'assets/svgassets/chat1.svg';
  final String svgthai = 'assets/svgassets/Thailand.svg';
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItem(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        child: InkWell(
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF093B9E),
                      Color(0xFF093B9E),
                      Color(0xFF0490B5),
                      Color(0xFF0764A9)
                    ], begin: Alignment.centerRight, end: Alignment.centerLeft),
                    border: Border.all(
                      width: 4,
                      color: Color.fromRGBO(216, 137, 92, 50),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  height: 130 + MediaQuery.of(context).padding.top,
                  width: 250 + MediaQuery.of(context).padding.top,
                  child: Stack(
                    children: [
                      Container(
                        height: 20 + MediaQuery.of(context).padding.top,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color(0xFFC06035),
                              Color(0xFFB15530),
                              Color(0xFFB15530),
                              Color(0xFFD98A5D),
                              Color(0XFFA94F2E),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 110 +
                                      MediaQuery.of(context).padding.right),
                              child: Text(
                                'Bronze Member',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 35 + MediaQuery.of(context).padding.left,
                          top: -10 + MediaQuery.of(context).padding.top,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffA94F2E),
                          //backgroundImage:AssetImage('assets/images/exprofile.png'),
                          radius: 30,
                          child: CircleAvatar(
                            radius: 27,
                            backgroundImage:
                                AssetImage('assets/images/exprofile.png'),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 190 + MediaQuery.of(context).padding.left,
                            top: 30 + MediaQuery.of(context).padding.top),
                        child: Image.asset('assets/images/profilelogo.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 60 + MediaQuery.of(context).padding.top,
                          left: 10 + MediaQuery.of(context).padding.left,
                        ),
                        child: Text(
                          'first Lastname',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 85 + MediaQuery.of(context).padding.top,
                            left: 10 + MediaQuery.of(context).padding.left),
                        child: Text(
                          '089-597-0000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItem(BuildContext context) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('ข้อมูลส่วนตัว'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const personalinfo()),
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svghistory),
            title: const Text('ประวัติการใช้งาน'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const historypage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: const Text('แลกรางวัล'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const exreward()),
                ),
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgcoupon),
            title: const Text('เก็บคูปอง'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const couponpage()),
                ),
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgstamp),
            title: const Text('บัตรสะสมแสตมป์'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const stamppage()),
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgwallet),
            title: const Text('วิธีการชำระเงิน'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const paymethpage()),
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgchat),
            title: const Text('ศูนย์บริการลูกค้า'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const callcenterpage()),
              );
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: SvgPicture.asset(svgthai),
            title: const Text('ภาษาไทย'),
            onTap: () {},
          ),
          SizedBox(
            height: 120,
          ),
          Container(
            height: 40,
            width: 150,
            margin: EdgeInsets.only(left: 80),
            child: ElevatedButton(
              onPressed: (() {}),
              child: Text(
                'ออกจากระบบ',
                style: TextStyle(
                  color: Color.fromRGBO(239, 78, 78, 20),
                ),
              ),
              style: ElevatedButton.styleFrom(
                //elevation: 0.8,
                backgroundColor: Color.fromRGBO(254, 228, 228, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      );
}
