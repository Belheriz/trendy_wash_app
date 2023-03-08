import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:trendy_mobile_1/graphql/graphql_service.dart';
import 'package:trendy_mobile_1/homepage/wash/washlauandry.dart';
import 'package:trendy_mobile_1/locationService/location_service.dart';
import 'washModel.dart';

class wash extends StatelessWidget {
  const wash({super.key});
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
      home: const Washmainpage(),
    );
  }
}

class Washmainpage extends StatefulWidget {
  const Washmainpage({
    super.key,
  });

  @override
  State<Washmainpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Washmainpage> {
  bool typing = false;
  List<washmodel>? _laundry;
  GraphQLService _graphQLService = GraphQLService();
  String? lat1, lon1;

  @override
  void initState() {
    super.initState();
    getLocation();
    _load();
  }

  void getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    if (locationData != null) {
      setState() {
        lat1 = locationData.latitude!.toStringAsFixed(2);
        lon1 = locationData.longitude!.toStringAsFixed(2);
      }
    }
  }

  void _load() async {
    _laundry = null;
    _laundry = await _graphQLService.getLaundry();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: typing
            ? TextBox()
            : Text(
                'พิมพ์ชื่อสาขาที่นี่',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                typing = !typing;
              });
            },
            icon: Icon(typing ? Icons.done : Icons.map_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment(-0.85, 0),
              child: Text(
                'สาขา Trendy Wash ใกล้ที่สุด ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _laundry!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    trailing: Icon(Icons.star),
                    leading: Image.asset(
                      _laundry![index].images,
                    ),
                    title: Text(
                      _laundry![index].washname,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: const washlaundry(),
                        withNavBar: false,
                      );
                    },
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(''),
                            SizedBox(
                              width: 20,
                            ),
                            Image.asset('assets/images/Location.png'),
                            Text('')
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xff093B9D),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Align(
                                alignment: Alignment(0, -0.5),
                                child: Text(
                                  _laundry![index].washer,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xff00BBA9),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Align(
                                alignment: Alignment(0, -0.5),
                                child: Text(
                                  _laundry![index].dryer,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment(-0.9, 0),
                          child: Text(
                            'ว่าง 3 เครื่อง',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        decoration:
            InputDecoration(border: InputBorder.none, hintText: 'Search'),
      ),
    );
  }
}
