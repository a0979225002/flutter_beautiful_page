import 'package:flutter/material.dart';
import 'package:flutterbeautifulpage/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'destination_carousel.dart';
import 'hotel_carousel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _TopButtonState createState() => _TopButtonState();
}

class _TopButtonState extends State<HomePage> {

  int _selectedIndex = 0;

  //icons 多個圖標
  List<IconData> _icons =[
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,

  ];
  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {//監聽點擊頂部哪顆按鈕
          _selectedIndex = index;
          print(index);
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex==index ?
          Theme.of(context).accentColor:
          Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index?
          Theme.of(context).primaryColor:
          Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 120.0),
              child: Text(
                "你想去哪裡?",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold//字體加粗
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _icons
                    .asMap()
                    .entries //放入迭代,讓他跑出key 0~4
                    .map((MapEntry map){
//                  flutter: MapEntry(0: IconData(U+0F02F))
//                  flutter: MapEntry(1: IconData(U+0F236))
//                  flutter: MapEntry(2: IconData(U+0F554))
//                  flutter: MapEntry(3: IconData(U+0F84A))
                  print(map);
                  return _buildIcon(map.key);
                }).toList()
            ),
            SizedBox(height: 10,),
            DestinationCarousel(),
            SizedBox(height: 10,),
            HotelCarousel(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 100),
              child: Column(
                children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Icon(
                         Icons.person,
                          size: 40,
                          color: Colors.blue,
                     ),
                     SizedBox(width: 5,),
                     Text(
                       "Lipin Travel Corporation",
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 25.0,
                           color: Theme.of(context).primaryColor
                       ),
                     ),
                   ],
                 ),
                  SizedBox(height: 2,),
                  Text(
                    "https://a0979225002.github.io/",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "服務電話:0979-XXX-XXX",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Colors.grey
                    ),
                  ),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}