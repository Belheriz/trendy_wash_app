import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/notification/notification.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/callcenter/callcenter.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/coupon/coupon.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/exreward/exreward.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/history/history.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/paymentmethod/paymentmethod.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/personalinfo/personalinfo.dart';
import 'package:trendy_mobile_1/homepage/sidemenu/stamp/stamp.dart';

class topUp extends StatelessWidget {
  const topUp({super.key});
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String svgrightcursor = 'assets/svgassets/rightcursor.svg';

    TextFormField _textmoney = new TextFormField(
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
          prefixIcon: Text(
            '฿',
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
          suffixIcon: TextButton(
            child: Text(
              'ยืนยัน',
              style: TextStyle(color: Color(0xff00BBA9)),
            ),
            onPressed: () {
              Navigator.pop;
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      content: Column(
                        children: [
                          Image.asset('assets/images/walletcomplete.png'),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'การเติมเงินสำเร็จ',
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
                              'ยอดเงินใน wallet ของคุณคือ',
                              style: TextStyle(
                                color: Color(0xff555555),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '450.50 บาท',
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
                                'ดูการเติมเงิน',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
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
          )),
      keyboardType: TextInputType.text,
      autocorrect: false,
    );

    Widget moneyinput() {
      return Container(
        width: 100, height: 40,
        //margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 240, 240, 240),
            border: Border.all(width: 1.2, color: Colors.cyanAccent),
            borderRadius: BorderRadius.all(Radius.circular(18))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Text('฿'),
            _textmoney,
            /*ElevatedButton(
              onPressed: () {},
              child: Text('ยืนยัน'),
            )*/
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'เติมเงิน',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        elevation: 0,
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
      ),
      drawer: const NavigationDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            width: 320,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff093B9E),
                  Color(0xff093B9E),
                  Color(0xff00BBA9),
                ],
                // stops: [0.1, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Text(
                    'ยอดเงินคงเหลือ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Align(
                  alignment: Alignment(-0.86, 0),
                  child: Text(
                    '00.00 ฿',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Text(
                    'อัพเดทล่าสุด 1.11',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'ช่องทางการเติมเงิน',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 250,
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Your desired background color
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3), blurRadius: 15),
                    ],
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/thaiqrlogo.png'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: Text(
                      'ผ่าน QR Code',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text('ฟรีค่าธรรมเนียม'),
                    trailing: SvgPicture.asset(
                      svgrightcursor,
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
                                    Align(
                                      alignment: Alignment(-0.8, 0),
                                      child: Text(
                                        'เติมเงินผ่าน QR Code',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'จำนวนที่ต้องการเติม',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            '(ยอดเงินคงเหลือ ฿00.00)',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 300,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Text(
                                                '50',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0),
                                            ),
                                          ),
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '100',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0)),
                                          ),
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '200',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 300,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '300',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0)),
                                          ),
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '500',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0)),
                                          ),
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '1000',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 240, 240, 240),
                                          border: Border.all(
                                              width: 1.2,
                                              color: Color(0xff00BBA9)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18))),
                                      width: MediaQuery.of(context).size.width,
                                      child: _textmoney,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset('assets/images/qrcode.png'),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'บันทุกรูปภาพ',
                                        style: TextStyle(
                                          color: Color(0xff00BBA9),
                                        ),
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
                                  ],
                                ),
                              ));
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Your desired background color
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3), blurRadius: 15),
                    ],
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/creditcardlogo.png'),
                    shape: RoundedRectangleBorder(),
                    title: Text(
                      'บัตรเครดิต',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text('มีค่าธรรมเนียม 5%'),
                    trailing: SvgPicture.asset(
                      svgrightcursor,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        // isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) => Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                child: Text('เติมเงินผ่าน QR Code'),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text('จำนวนที่ต้องการเติม'),
                                    Text('(ยอดเงินคงเหลือ ฿350.50)'),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text('50'),
                                      ),
                                    ),
                                    Container(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text('100'),
                                      ),
                                    ),
                                    Container(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text('200'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Your desired background color
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3), blurRadius: 15),
                    ],
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/truemoneylogo.png'),
                    shape: RoundedRectangleBorder(),
                    title: Text(
                      'True money',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text('มีค่าธรรมเนียม 5%'),
                    trailing: SvgPicture.asset(
                      svgrightcursor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                      Color(0xFF0764A9),
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
              Navigator.of(context).push(
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
