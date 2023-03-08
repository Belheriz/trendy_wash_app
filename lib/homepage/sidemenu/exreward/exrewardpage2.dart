import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/size_helper.dart';

const List<String> provinceitem = <String>['จังหวัด'];
const List<String> aumperitem = <String>['อำเภอ'];
const List<String> tumbolitem = <String>['ตำบล'];

class rewardresult extends StatelessWidget {
  const rewardresult({super.key});
  static const MaterialColor blue = MaterialColor(
    whitePrimaryValue,
    <int, Color>{
      50: Color(0xFFffffff),
      100: Color(0xFFffffff),
      200: Color(0xFFffffff),
      300: Color(0xFFffffff),
      400: Color(0xFFffffff),
      500: Color(whitePrimaryValue),
      600: Color(0xFFffffff),
      700: Color(0xFFffffff),
      800: Color(0xFFffffff),
      900: Color(0xFFffffff),
    },
  );
  static const int whitePrimaryValue = 0xFFFFFFFF;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: blue,
        fontFamily: 'LineseedsanRg',
      ),
      home: const _rewardresult(),
    );
  }
}

class _rewardresult extends StatefulWidget {
  const _rewardresult({
    super.key,
  });

  @override
  State<_rewardresult> createState() => Rewardresult();
}

class Rewardresult extends State<_rewardresult> {
  String dropproValue = provinceitem.first;
  String dropaumValue = aumperitem.first;
  String droptumValue = tumbolitem.first;

  TextFormField _textname = new TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'กรุณาชื่อ-นามสกุล';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8), border: InputBorder.none),
    keyboardType: TextInputType.phone,
    autocorrect: false,
  );

  TextFormField _textlocation = new TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'กรุณาใส่ที่อยู่';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8), border: InputBorder.none),
    keyboardType: TextInputType.phone,
    autocorrect: false,
  );

  TextFormField _textpost = new TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'กรุณาใส่เลขไปรษ์รีย์';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8), border: InputBorder.none),
    keyboardType: TextInputType.phone,
    autocorrect: false,
  );
  TextFormField _textTelephone = new TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'กรุณาใส่เบอร์โทรศัพท์';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8), border: InputBorder.none),
    keyboardType: TextInputType.phone,
    autocorrect: false,
  );

  Widget nameinput() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          border: Border.all(width: 1.2, color: Colors.cyanAccent),
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: _textname,
    );
  }

  Widget locationinput() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          border: Border.all(width: 1.2, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: _textlocation,
    );
  }

  Widget postinput() {
    return Container(
      height: 40, width: 100,
      //margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          border: Border.all(width: 1.2, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: _textpost,
    );
  }

  Widget phoneinput() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          border: Border.all(width: 1.2, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: _textTelephone,
    );
  }

  Widget dropdownProvince() {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: DropdownButton<String>(
          isExpanded: true,
          value: dropproValue,
          icon: const Icon(
            Icons.arrow_downward,
            color: Colors.grey,
          ),
          underline: Container(
            height: 0,
          ),
          elevation: 16,
          style: const TextStyle(color: Colors.grey),
          items: provinceitem.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              dropproValue = value!;
            });
          }),
    );
  }

  Widget dropdownAumper() {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: DropdownButton<String>(
          isExpanded: true,
          value: dropaumValue,
          icon: const Icon(
            Icons.arrow_downward,
            color: Colors.grey,
          ),
          underline: Container(
            height: 0,
          ),
          elevation: 16,
          style: const TextStyle(color: Colors.grey),
          items: aumperitem.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              dropaumValue = value!;
            });
          }),
    );
  }

  Widget dropdowntumbol() {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: DropdownButton<String>(
          isExpanded: true,
          value: droptumValue,
          icon: const Icon(
            Icons.arrow_downward,
            color: Colors.grey,
          ),
          underline: Container(
            height: 0,
          ),
          elevation: 16,
          style: const TextStyle(color: Colors.grey),
          items: tumbolitem.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              droptumValue = value!;
            });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);
    double h = displayHeight(context) -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();

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
          '',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/exreward1_4x.png',
              height: 280,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'น้ำยาปรับผ้านุ่ม Fresh & Soft Still All day 12 ซอง',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment(-0.94, -0.0),
              child: Text(
                '10 ต.ค.- 30 ธ.ค. 65',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset('assets/images/positionIcon.png'),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text('ที่อยู่การจัดส่งสินค้า'),
                  SizedBox(
                    width: w * 0.35,
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text(
                        'แก้ไข้ที่อยู่',
                        style: TextStyle(
                          color: Color(0xff00BBA9),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                insetPadding: EdgeInsets.zero,
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                          'ที่อยู่การจัดส่งสินค้า',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                        alignment: Alignment(-0.9, 0),
                                        child: Text(
                                          'ชื่อ-นามสกุลผู้รับ',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      nameinput(),
                                      Align(
                                        alignment: Alignment(-0.9, 0),
                                        child: Text(
                                          'ที่อยู่',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      locationinput(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            dropdownProvince(),
                                            SizedBox(
                                              width: 70,
                                            ),
                                            dropdownAumper(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            dropdowntumbol(),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            postinput(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment(-0.9, 0),
                                        child: Text(
                                          'เบอร์โทรศัพท์',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      phoneinput(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: (() {}),
                                                child: Text(
                                                  'บันทึก',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff093B9E),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(14),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Container(
                                              width: 90,
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: (() {
                                                  Navigator.pop(context);
                                                }),
                                                child: Text(
                                                  'ยกเลิก',
                                                  style: TextStyle(
                                                    color: Color(0xff00E1CB),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffD9F5F2),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(14),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
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
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              child: Container(
                margin: EdgeInsets.only(right: 60),
                width: 250,
                child: Text(
                    'Firstname Lastname(089-597-6551)  98/35 ม.11 ซ.มลายูบางกอก3 ต.สะเตงนอก อ.เมือง จ.ยะลา 95000'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Align(
                          child: Text(
                            'จำนวน 25 คะแนน',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          child: Text(
                            '(พอยท์ที่สะสม 125 คะแนน)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 95,
                  ),
                  Align(
                    child: Text('จำนวนสินค้า'),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    'รวม 50 คะแนน',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00BBA9)),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    '2',
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.add),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(3),
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          insetPadding: EdgeInsets.zero,
                          content: Column(
                            children: [
                              Image.asset('assets/images/giftboxreward.png'),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  'แลกรางวัลความสำเร็จ',
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
                                  'ของรางวัลลูกค้าจะได้รับ',
                                  style: TextStyle(
                                    color: Color(0xff555555),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'ภายใน 7 วันทำการ',
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
                                    'แลกรางวัลอื่นๆ',
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
                child: Text(
                  'ยืนยันการแลกรางวัล',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
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
          ],
        ),
      ),
    );
  }
}
