import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonSheet extends StatefulWidget {
  ButtonSheet({Key key}) : super(key: key);

  @override
  _ButtonSheetState createState() => _ButtonSheetState();
}

class _ButtonSheetState extends State<ButtonSheet>
    with SingleTickerProviderStateMixin{

  final double _minHeight = 100;
  AnimationController _controller;//建立動畫控制器

  double get maxHeight => MediaQuery.of(context).size.height;
  //獲得此手機螢幕總高度

  @override
  void initState() { //初始化控制器
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }
  @override
  void dispose() { //關掉時,結束動畫

    _controller.dispose();
    print("何時關掉");
    super.dispose();
  }

  double lerp(double min,double max){
    return lerpDouble(min, max, _controller.value);
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
      animation: _controller,
      builder: (context,child){
        return Positioned(
          height: lerp(_minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _toggle,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                  color: Color(0xFF162A49),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
            ),
          ),
        );
      },
    );
  }
  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    print(_controller.status);
    _controller.fling(velocity: isOpen ? -2 : 2); //給予動畫效果 由下往上
  }
}