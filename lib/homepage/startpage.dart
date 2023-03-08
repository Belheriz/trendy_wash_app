import 'package:flutter/material.dart';

const List<String> language = ['ไทย', 'En'];

class _Startpage extends StatefulWidget {
  @override
  State<_Startpage> createState() => StartpageState();
}

class StartpageState extends State<_Startpage> {
  String droplangValue = language.first;

  Widget blankspace() {
    return Container(
      child: SizedBox(
        height: 20,
      ),
    );
  }

  Widget dropSelectlanguage() {
    return Container(
      child: DropdownButton<String>(
        isExpanded: true,
        value: droplangValue,
        icon: const Icon(
          Icons.arrow_downward,
          color: Colors.white,
        ),
        underline: Container(
          height: 0,
        ),
        elevation: 16,
        style: const TextStyle(
          color: Colors.white,
        ),
        items: language.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            child: Text(value),
            value: value,
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            droplangValue = value!;
          });
        },
      ),
    );
  }

  Widget textwelcline1() {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text('ยินดีต้อนรับสู่'),
          ),
          Container(
            child: Text('Trendy Wash App'),
          ),
          Container(
            child: Text('ซัก อบ ผ่าน แอปๆง่ายนิดเดียว'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        decoration: BoxDecoration(
          /*image: DecorationImage(
            image: AssetImage('assets/images/BgStartpage.png'),
            fit: BoxFit.fitWidth,
          ),*/
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF093B9E),
              Color(0xFF005C86),
              Color(0xFF005C86),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.0),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                blankspace(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [dropSelectlanguage()],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
