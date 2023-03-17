import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:trendy_mobile_1/homepage/wash/wash.dart';
import 'package:trendy_mobile_1/homepage/wash/washerModel.dart';
import 'package:trendy_mobile_1/homepage/wash/washpromotion.dart';

import 'dryermodel.dart';

class washlaundry extends StatelessWidget {
  const washlaundry(
      {super.key, required this.siteIdData, required this.siteNameData});
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
        fontFamily: 'LineseedsanRg',
      ),
      home: _washlaundry(
        siteId: siteIdData,
        siteName: siteNameData,
      ),
    );
  }
}

class _washlaundry extends StatefulWidget {
  const _washlaundry({
    super.key,
    required this.siteId,
    required this.siteName,
  });
  final String siteName;
  final String siteId;
  @override
  State<_washlaundry> createState() => _washlaundryPageState(
        useSiteid: siteId,
        useSitename: siteName,
      );
}

class _washlaundryPageState extends State<_washlaundry> {
  _washlaundryPageState({required this.useSiteid, required this.useSitename});

  final String useSiteid;
  final String useSitename;

  String readRepositories = """
query getMachineBySite( \$siteId: ID! ){
      getMachineBySite(siteId: \$siteId){
        deviceName
        machine_group
        machine_name
        machine_model
        customer_name
        price_default
      }
    }

""";

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

  List<washermodel> washer = [
    washermodel(
      washername: 'เครื่องซักผ้า NO.1 ',
      images: 'assets/images/washer1.png',
      price: 'เริ่มต้น 30 บาท',
      kilo: 'เครื่องซัก 8 kg.',
    ),
    washermodel(
      washername: 'เครื่องซักผ้า NO.2 ',
      images: 'assets/images/washer2.png',
      price: 'เริ่มต้น 40 บาท',
      kilo: 'เครื่องซัก 10 kg.',
    ),
    washermodel(
      washername: 'เครื่องซักผ้า NO.3 ',
      images: 'assets/images/washer2.png',
      price: 'เริ่มต้น 40 บาท',
      kilo: 'เครื่องซัก 10 kg.',
    ),
    washermodel(
      washername: 'เครื่องซักผ้า NO.4',
      images: 'assets/images/washer3.png',
      price: 'เริ่มต้น 60 บาท',
      kilo: 'เครื่องซัก 18 kg.',
    ),
  ];

  List<dryermodel> dryer = [
    dryermodel(
        dryername: 'เครื่องอบผ้า NO.1 ',
        images: 'assets/images/dryer1.png',
        price: 'เริ่มต้น 30 บาท',
        kilo: 'เครื่องซัก 8 kg.'),
    dryermodel(
        dryername: 'เครื่องอบผ้า NO.2 ',
        images: 'assets/images/dryer2.png',
        price: 'เริ่มต้น 40 บาท',
        kilo: 'เครื่องซัก 10 kg.'),
    dryermodel(
        dryername: 'เครื่องอบผ้า NO.3',
        images: 'assets/images/dryer2.png',
        price: 'เริ่มต้น 50 บาท',
        kilo: 'เครื่องซัก 15 kg.'),
  ];
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
              variables: {'siteId': "636caba997b41d387c6a2abf"},
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
              List dryingMachines = machines!
                  .where(
                      (machine) => machine['machine_group'] == 'เครื่องอบผ้า')
                  .toList();

              if (machines == null) {
                return const Text('No repositories');
              }

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
                                                    onPressed: () async {
                                                      Navigator.pop;
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              content: Column(
                                                                children: [
                                                                  Image.asset(
                                                                      'assets/images/laundrycomplete.png'),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Center(
                                                                    child: Text(
                                                                      'คำสั่งซักผ้าสำเร็จ',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 60,
                                                                  ),
                                                                  Container(
                                                                    height: 40,
                                                                    width: 180,
                                                                    child:
                                                                        ElevatedButton(
                                                                      child:
                                                                          Text(
                                                                        'ดูการเติมเงิน',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
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
                                                                    child:
                                                                        ElevatedButton(
                                                                      child:
                                                                          Text(
                                                                        'กลับหน้าหลัก',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xff00BBA9),
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                      onPressed:
                                                                          () {},
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            Color(0xffD9F5F2),
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(
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
                          title: Text(
                            washer?['machine_name'] ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
                                    'พร้อมใช้งาน',
                                    style: TextStyle(
                                      color: Color(0xff00BBA9),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 90,
                                  ),
                                  Text(
                                    '1 ชั่วโมง',
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
                        return ListTile(
                          //leading: Image.asset(dryerlist.images),
                          title: Text(
                            dryer?['machine_name'] ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
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
                                    'พร้อมใช้งาน',
                                    style: TextStyle(
                                      color: Color(0xff00BBA9),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 90,
                                  ),
                                  Text(
                                    '1 ชั่วโมง',
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
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
