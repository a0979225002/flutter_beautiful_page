import 'package:flutter/material.dart';
import 'Pages/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,//不顯示Debug標籤
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color.alphaBlend(Colors.white70, Colors.white60),
      ),
      home: HomeScreen(),
    );
  }
}
