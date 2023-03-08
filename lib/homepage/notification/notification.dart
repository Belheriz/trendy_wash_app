import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';

class notification extends StatelessWidget {
  const notification({super.key});
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
    return DefaultTabController(
      length: 5,
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
              'การแจ้งเตือน',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            bottom: TabBar(tabs: [
              Tab(
                text: 'ล่าสุด',
              ),
              Tab(
                text: 'ซักผ้า',
              ),
              Tab(
                text: 'เติมเงิน',
              ),
              Tab(
                text: 'โปรโมชั่น',
              ),
              Tab(
                text: 'บัญชี',
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
              Center(
                child: Text('Page 4'),
              ),
              Center(
                child: Text('Page 5'),
              ),
            ],
          )),
    );
  }
}
