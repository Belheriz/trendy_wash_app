import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';

class historypage extends StatelessWidget {
  const historypage({super.key});
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
      home: const History(),
    );
  }
}

class History extends StatefulWidget {
  const History({
    super.key,
  });

  @override
  State<History> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<History> {
  String svgluandry = 'assets/svgassets/Laundry.svg';
  String svgwallet = 'assets/svgassets/wallet2.svg';
  String svgGiftbox = 'assets/svgassets/Giftbox.svg';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              'ประวัติการใช้งาน',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            bottom: TabBar(tabs: [
              Tab(
                icon: SvgPicture.asset(svgluandry),
                text: 'ซักผ้า',
              ),
              Tab(
                icon: SvgPicture.asset(svgwallet),
                text: 'เติมเงิน',
              ),
              Tab(
                icon: SvgPicture.asset(svgGiftbox),
                text: 'แลกรางวัล',
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text('Page 1'),
              ),
              Center(
                child: Text('Page 2'),
              ),
              Center(
                child: Text('Page 3'),
              ),
            ],
          )),
    );
  }
}
