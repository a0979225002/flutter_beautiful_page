import 'package:flutter/material.dart';
import 'package:flutterbeautifulpage/widgets/HomePage.dart';
import 'package:flutterbeautifulpage/widgets/button_sheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        HomePage(),//頁面卡片配置
        ButtonSheet(),//底部配置
      ],
    );
  }
}
