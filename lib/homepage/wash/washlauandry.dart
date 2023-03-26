import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:trendy_mobile_1/homepage/wash/wash.dart';
import 'package:trendy_mobile_1/homepage/wash/washerModel.dart';
import 'package:trendy_mobile_1/homepage/wash/washpromotion.dart';

import 'dryermodel.dart';
import 'dart:io';

final HttpLink httpLink = HttpLink(
  'https://api.graphql.trendywash.net/',
);
final AuthLink authLink = AuthLink(
  getToken: () async =>
      'Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MDZkMjM0ZTM5MTJmZTgwZDEyODQ3MCIsImlhdCI6MTY3ODIxODk5OSwiZXhwIjoxNjc4MzA1Mzk5fQ.NF9ovfe--0-DlTTkGW4mFORI1YTDSDWOK7cXDLzZSWo>',
);

final Link link = authLink.concat(httpLink);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  ),
);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

class washlaundry extends StatelessWidget {
  const washlaundry(
      {super.key,
      required this.siteIdData,
      required this.siteNameData,
      required this.graphQLClient});
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

  final String siteNameData;
  final String siteIdData;
  final ValueNotifier<GraphQLClient> graphQLClient;

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = new MyHttpOverrides();
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: white,
          fontFamily: 'LineseedsanRg',
        ),
        home: _washlaundry(
          siteId: siteIdData,
          siteName: siteNameData,
          client: graphQLClient,
        ),
      ),
    );
  }
}

/*Future<void> _startDeviceMutation({
    required String deviceName,
    required String customerName,
    required String customerId,
    required String actionPrice,
    required String actionVia,
  }) async {
    final result = await passClient.value.mutate(
      MutationOptions(
        document: gql('''
          mutation StartDevice(\$deviceName: String!, \$customerName: String!, \$customerId: String!, \$actionPrice: String!, \$actionVia: String!, \$promotionId: String, \$mode: [String]!, \$option: String!) {
            startDevice(
              deviceName: \$deviceName
              customer_name: \$customerName
              customer_id: \$customerId
              action_price: \$actionPrice
              action_via: \$actionVia
              promotionId: \$promotionId
              mode: \$mode
              option: \$option
            )
          }
        '''),
        variables: {
          'deviceName': deviceName,
          'customerName': customerName,
          'customerId': customerId,
          'actionPrice': actionPrice,
          'actionVia': actionVia,
          'promotionId': '',
          'mode': ['1'],
          'option': '',
        },
      ),
    );*/
class _washlaundry extends StatefulWidget {
  const _washlaundry(
      {super.key,
      required this.siteId,
      required this.siteName,
      required this.client});
  final String siteName;
  final String siteId;
  final ValueNotifier<GraphQLClient> client;
  @override
  State<_washlaundry> createState() => _washlaundryPageState(
        useSiteid: siteId,
        useSitename: siteName,
        passClient: client,
      );
}

class _washlaundryPageState extends State<_washlaundry> {
  _washlaundryPageState({
    required this.useSiteid,
    required this.useSitename,
    required this.passClient,
  });

  final String useSiteid;
  final String useSitename;
  final ValueNotifier<GraphQLClient> passClient;

  bool _isLoading = false;

  String readRepositories = """
query getMachineBySite( \$siteId: ID! ){
      getMachineBySite(siteId: \$siteId){
        deviceName
        machine_group
        machine_name
        machine_model
        customer_name
        price_default
        device_status
        machine_time_count
        time_default
      }
    }

""";

  void _startDevice(BuildContext context, String deviceName) async {
    setState(() {
      _isLoading = true;
    });

    final QueryResult result = await GraphQLProvider.of(context).value.mutate(
          MutationOptions(
            document: gql(startDeviceMutation),
            variables: {
              'deviceName': deviceName,
              'customer_name': 'Prik',
              'customer_id': '1',
              'action_price': '40',
              'action_via': 'mobile',
              'promotionId': '',
              'mode': ['1'],
              'option': '',
            },
          ),
        );

    setState(() {
      _isLoading = false;
    });

    if (result.hasException) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: Text(result.exception.toString()),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      print(startDeviceMutation);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            content: Column(
              children: [
                Image.asset('assets/images/laundrycomplete.png'),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'คำสั่งซักผ้าสำเร็จ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
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
            ),
          );
        },
      );
    }
  }

  String startDeviceMutation = '''
  mutation StartDevice(
    \$deviceName: String!
    \$customer_name: String!
    \$customer_id: String!
    \$action_price: String!
    \$action_via: String!
    \$promotionId: String!
    \$mode: [String!]!
    \$option: String!
  ) {
    startDevice(
      deviceName: \$deviceName
      customer_name: \$customer_name
      customer_id: \$customer_id
      action_price: \$action_price
      action_via: \$action_via
      promotionId: \$promotionId
      mode: \$mode
      option: \$option
    )
  }
''';

  bool ischeck = false;
  bool ischeck2 = false;
  bool ischeck3 = false;
  bool ischeck4 = false;
  bool ischeck5 = false;
  bool ischeck6 = false;
  bool ischeck7 = false;
  bool ischeck8 = false;
  bool ischeck9 = false;
  bool ischeck10 = false;
  bool ischeck11 = false;
  TextFormField _textcoupon = new TextFormField(
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
      suffixIcon: TextButton(
        child: Text(
          'ยืนยัน',
          style: TextStyle(color: Color(0xff00BBA9)),
        ),
        onPressed: () {
          Navigator.pop;
        },
      ),
      hintText: 'กรอกโค้ดส่วนลดที่นี่',
      hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
    ),
    keyboardType: TextInputType.text,
    autocorrect: false,
  );

  List<washpromotion> promotion = [
    washpromotion(images: 'assets/images/washpromotion1.png'),
    washpromotion(images: 'assets/images/washpromotion2.png'),
    washpromotion(images: 'assets/images/washpromotion1.png'),
    washpromotion(images: 'assets/images/washpromotion2.png'),
  ];

  double _progressValue = 0.0;
  String formattedTime = '';

  String deviceStatus = '';

  void _startProgress() {
    const duration = const Duration(milliseconds: 3600);
    Timer.periodic(duration, (Timer timer) {
      setState(() {
        _progressValue += 0.01;
        if (_progressValue >= 1.0) {
          timer.cancel();
        }
      });
    });
  }

//"siteId": "63be59e2cbda00cdb4b56f62"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: BackButton(
                color: Colors.black,
                onPressed: () {},
              ),
              title: Text(
                useSitename,
                //'Trendy Wash AT Taksin ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 250,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              flexibleSpace: Container(
                margin: EdgeInsets.only(
                  top: 50 + MediaQuery.of(context).padding.top,
                ),
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/washpromotion1.png',
                      ),
                      iconSize: 220,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/washpromotion2.png',
                      ),
                      iconSize: 220,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/washpromotion1.png',
                      ),
                      iconSize: 220,
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Query(
            options: QueryOptions(
              document: gql(readRepositories),
              pollInterval: const Duration(seconds: 10),
              variables: {'siteId': useSiteid},
            ),
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.isLoading) {
                return const Text('Loading');
              }

              List? machines = result.data?['getMachineBySite'];
              List washingMachines = machines!
                  .where(
                      (machine) => machine['machine_group'] == 'เครื่องซักผ้า')
                  .toList();
              List dryingMachines = machines
                  .where(
                      (machine) => machine['machine_group'] == 'เครื่องอบผ้า')
                  .toList();

              washingMachines.sort((a, b) {
                int aNum = int.parse(
                    a["machine_name"].replaceAll(RegExp(r'[^\d]'), ''));
                int bNum = int.parse(
                    b["machine_name"].replaceAll(RegExp(r'[^\d]'), ''));
                int numComparison = aNum.compareTo(bNum);
                if (numComparison != 0) {
                  return numComparison;
                }
                return a["machine_name"].compareTo(b["machine_name"]);
              });
              dryingMachines.sort((a, b) {
                int aNum = int.parse(
                    a["machine_name"].replaceAll(RegExp(r'[^\d]'), ''));
                int bNum = int.parse(
                    b["machine_name"].replaceAll(RegExp(r'[^\d]'), ''));
                int numComparison = aNum.compareTo(bNum);
                if (numComparison != 0) {
                  return numComparison;
                }
                return a["machine_name"].compareTo(b["machine_name"]);
              });

              if (machines == null) {
                return const Text('No repositories');
              }
              print(readRepositories);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        'เครื่องซัก',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: washingMachines.length,
                      itemBuilder: (BuildContext context, int index) {
                        final washer = washingMachines[index];
                        String keeptime = washer?['time_default'] ?? '';
                        int seconds = int.tryParse(keeptime) ?? 0;
                        int minutes = seconds ~/ 60;
                        String formattedTime = minutes.toString() + ' นาที';
                        if (minutes > 1) {
                          formattedTime += 's';
                        }
                        //Duration duration = Duration(seconds: seconds);
                        /* String formattedTime =
                            duration.inHours.toString() + ' hour';*/
                        print(keeptime);
                        print('seconds:$seconds');
                        print(washer?['machine_group'] ?? "");
                        print(washer?["machine_name"] ?? "");

                        /*if (duration.inHours > 1) {
                          formattedTime += 's';
                        }*/
                        String devicesta = washer?['device_status'] ?? '';

                        if (devicesta == '0') {
                          String statusOnline = 'เครื่องว่าง';
                          deviceStatus = statusOnline;
                        } else if (devicesta == 1) {
                          String statusWorking = 'เครื่องทำงานอยู่';
                          deviceStatus = statusWorking;
                        } else if (devicesta == -1) {
                          String statusOffline = 'ขาดการเชื่อมต่อ';
                          deviceStatus = statusOffline;
                        }
                        return ListTile(
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
                                          MediaQuery.of(context).size.height *
                                              1.5,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 360,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'เครื่องซักผ้า  NO.1 อาคาร  A',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'เครื่องซัก 8 kg. เริ่มต้น ฿30   45 นาที',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Image.asset(
                                                    'assets/images/upcursor2.png')
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                title:
                                                    Text('ล้างถังฆ่าเชื้่อโรค'),
                                                subtitle: Text('+ ฿10'),
                                                value: ischeck,
                                                activeColor: Color(0xff00BBA9),
                                                checkColor: Colors.white,
                                                onChanged: (value) {
                                                  setState(() {
                                                    ischeck = value!;
                                                  });
                                                }),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.only(left: 15),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'เลือกน้ำซัก ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  '(เลือก 1 รายการ)',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 360,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      title: Text('ซักน้ำเย็น'),
                                                      subtitle: Text('+ ฿0'),
                                                      value: ischeck2,
                                                      activeColor:
                                                          Color(0xff00BBA9),
                                                      checkColor: Colors.white,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          ischeck2 = value!;
                                                        });
                                                      }),
                                                ),
                                                Expanded(
                                                  child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      title: Text('ซักน้ำเย็น'),
                                                      subtitle: Text('+ ฿10'),
                                                      value: ischeck3,
                                                      activeColor:
                                                          Color(0xff00BBA9),
                                                      checkColor: Colors.white,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          ischeck3 = value!;
                                                        });
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 360,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      title: Text('ซักน้ำร้อน'),
                                                      subtitle: Text('+ ฿20'),
                                                      value: ischeck4,
                                                      activeColor:
                                                          Color(0xff00BBA9),
                                                      checkColor: Colors.white,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          ischeck4 = value!;
                                                        });
                                                      }),
                                                ),
                                                Expanded(
                                                  child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      title: Text(
                                                          'ถนอมผ้าน้ำเย็น'),
                                                      subtitle: Text('+ ฿0'),
                                                      value: ischeck5,
                                                      activeColor:
                                                          Color(0xff00BBA9),
                                                      checkColor: Colors.white,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          ischeck5 = value!;
                                                        });
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 360,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      title: Text(
                                                          'ถนอมผ้าน้ำอุ่น'),
                                                      subtitle: Text('+ ฿10'),
                                                      value: ischeck6,
                                                      activeColor:
                                                          Color(0xff00BBA9),
                                                      checkColor: Colors.white,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          ischeck6 = value!;
                                                        });
                                                      }),
                                                ),
                                                Expanded(
                                                  child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      title:
                                                          Text('ผ้าห่มน้ำเย็น'),
                                                      subtitle: Text('+ ฿0'),
                                                      value: ischeck7,
                                                      activeColor:
                                                          Color(0xff00BBA9),
                                                      checkColor: Colors.white,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          ischeck7 = value!;
                                                        });
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15),
                                            child: Row(
                                              children: [
                                                Text('เพิ่มรอบซัก ',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    )),
                                                Text(
                                                    '(เลือกได้มากว่า 1 รายการ)',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 70,
                                            width: 360,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      title:
                                                          Text('เพิ่มรอบซัก'),
                                                      subtitle: Text('+ ฿10'),
                                                      value: ischeck6,
                                                      activeColor:
                                                          Color(0xff00BBA9),
                                                      checkColor: Colors.white,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          ischeck6 = value!;
                                                        });
                                                      }),
                                                ),
                                                Expanded(
                                                  child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      title:
                                                          Text('เพิ่มรอบล้าง'),
                                                      subtitle: Text('+ ฿10'),
                                                      value: ischeck7,
                                                      activeColor:
                                                          Color(0xff00BBA9),
                                                      checkColor: Colors.white,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          ischeck7 = value!;
                                                        });
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(
                                              -0.9,
                                              0,
                                            ),
                                            child: Text('ชำระเงินด้วยวอลเล็ท'),
                                          ),
                                          Container(
                                            width: 330,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0xffE6F9F7),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(22),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('ยอดเงินคงเหลือ ฿350.50'),
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'เติมเงิน',
                                                    style: TextStyle(
                                                      color: Color(0xff00BBA9),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(),
                                            width: 380,
                                            child: ElevatedButton(
                                              child: Text(
                                                'กรอกโค้ดส่วนลดที่นี่                                    เลือกคูปอง>',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                        top:
                                                            Radius.circular(20),
                                                      ),
                                                    ),
                                                    context: context,
                                                    builder:
                                                        (context) => Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.75,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Container(
                                                                    width: 320,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'คูปองส่วนลด',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                24,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        IconButton(
                                                                            onPressed:
                                                                                () {},
                                                                            icon:
                                                                                Icon(
                                                                              Icons.close,
                                                                              color: Color(0xff093B9E),
                                                                            ))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    width: 300,
                                                                    height: 40,
                                                                    child:
                                                                        _textcoupon,
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                20),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          'คูปองที่สามารถใช้ได้  ',
                                                                          style:
                                                                              TextStyle(fontSize: 16),
                                                                        ),
                                                                        Text(
                                                                          '(เลือก 1 คูปอง)',
                                                                          style:
                                                                              TextStyle(color: Colors.grey),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  CheckboxListTile(
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .trailing,
                                                                      title:
                                                                          Text(
                                                                        'พิเศษเฉพาะสมาชิกใหม่',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      subtitle:
                                                                          Column(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                Alignment(-1, 0),
                                                                            child:
                                                                                Text(
                                                                              'ลดทันที 20%',
                                                                              style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                Alignment(-1, 0),
                                                                            child:
                                                                                Text('หมดอายุ 30 ธ.ค. 2565'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      value:
                                                                          ischeck10,
                                                                      activeColor:
                                                                          Color(
                                                                              0xff00BBA9),
                                                                      checkColor:
                                                                          Colors
                                                                              .white,
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          ischeck10 =
                                                                              value!;
                                                                        });
                                                                      }),
                                                                  CheckboxListTile(
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .trailing,
                                                                      title:
                                                                          Text(
                                                                        'ยอดใช้งานสะสม ฿500',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      subtitle:
                                                                          Column(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                Alignment(-1, 0),
                                                                            child:
                                                                                Text(
                                                                              'รับส่วนลด 50฿',
                                                                              style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                Alignment(-1, 0),
                                                                            child:
                                                                                Text('หมดอายุ 30 ธ.ค. 2565'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      value:
                                                                          ischeck11,
                                                                      activeColor:
                                                                          Color(
                                                                              0xff00BBA9),
                                                                      checkColor:
                                                                          Colors
                                                                              .white,
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          ischeck11 =
                                                                              value!;
                                                                        });
                                                                      }),
                                                                  SizedBox(
                                                                    height: 40,
                                                                  ),
                                                                  Container(
                                                                    width: 280,
                                                                    height: 50,
                                                                    child:
                                                                        ElevatedButton(
                                                                      child:
                                                                          Text(
                                                                        'ยืนยัน',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 18),
                                                                      ),
                                                                      onPressed:
                                                                          () {},
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            Color(0xff093B9E),
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(
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
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: 320,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'รวม 60 บาท',
                                                        style: TextStyle(
                                                            color: Color(
                                                              0xff00BBA9,
                                                            ),
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment(-1, 0),
                                                        child: Text(
                                                            'เวลาซัก 1 ชม.'),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 180,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop;
                                                      _startDevice(
                                                          context,
                                                          washer?['deviceName'] ??
                                                              "");
                                                    },
                                                    child: Text(
                                                      'เริ่มซักผ้า',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Color(0xff093B9E),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        14)))),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                          },
                          //leading: Image.asset(washerlist.images),
                          title: Row(
                            children: [
                              Text(
                                washer?['machine_group'] ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                washer?['machine_name'] ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),

                          trailing: SvgPicture.asset(
                              'assets/svgassets/downcursor.svg'),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    washer?['machine_model'] ?? '',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    washer?['price_default'] ?? '',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    deviceStatus,
                                    style: TextStyle(
                                      color: Color(0xff00BBA9),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 90,
                                  ),
                                  Text(
                                    formattedTime,
                                    // washer?['time_default'] ?? '',
                                    style: TextStyle(
                                      color: Color(0xff00BBA9),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 10,
                                width: 250,
                                child: LinearProgressIndicator(
                                  value: _progressValue,
                                  backgroundColor: Color(0xffD9F5F2),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        'เครื่องอบ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    /*
                    
                    
                    
                    
                    
                    
                    listviewDryer
                    
                    
                    
                     
                     
                     
                     */
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: dryingMachines.length,
                      itemBuilder: (BuildContext context, int index) {
                        final dryer = dryingMachines[index];
                        String keeptime = dryer?['time_default'] ?? '';
                        int seconds = int.tryParse(keeptime) ?? 0;
                        int minutes = seconds ~/ 60;
                        String formattedTime = minutes.toString() + ' นาที';
                        if (minutes > 1) {
                          formattedTime += 's';
                        }
                        //Duration duration = Duration(seconds: seconds);
                        /* String formattedTime =
                            duration.inHours.toString() + ' hour';*/
                        print(keeptime);
                        print('seconds:$seconds');
                        /*if (duration.inHours > 1) {
                          formattedTime += 's';
                        }*/
                        String devicesta = dryer?['device_status'] ?? '';

                        if (devicesta == '0') {
                          String statusOnline = 'เครื่องว่าง';
                          deviceStatus = statusOnline;
                        } else if (devicesta == 1) {
                          String statusWorking = 'เครื่องทำงานอยู่';
                          deviceStatus = statusWorking;
                        } else if (devicesta == -1) {
                          String statusOffline = 'ขาดการเชื่อมต่อ';
                          deviceStatus = statusOffline;
                        }
                        return ListTile(
                          //leading: Image.asset(dryerlist.images),
                          title: Row(
                            children: [
                              Text(
                                dryer?['machine_group'] ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                dryer?['machine_name'] ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          /*Text(
                            dryer?['machine_name'] ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),*/
                          trailing: SvgPicture.asset(
                              'assets/svgassets/downcursor.svg'),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    dryer?['machine_model'] ?? '',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    dryer?['price_default'] ?? '',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    deviceStatus,
                                    style: TextStyle(
                                      color: Color(0xff00BBA9),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 90,
                                  ),
                                  Text(
                                    formattedTime,
                                    style: TextStyle(
                                      color: Color(0xff00BBA9),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 10,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Color(0xffD9F5F2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Text(useSiteid),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
