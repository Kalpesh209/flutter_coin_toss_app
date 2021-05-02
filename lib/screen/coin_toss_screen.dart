import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_coin_toss_app/screen/widget/build_head_widget.dart';
import 'package:flutter_coin_toss_app/screen/widget/build_tail_widget.dart';

/*
Title:CoinTossScreen
Purpose:CoinTossScreen
Created By:Kalpesh Khandla
*/

class CoinTossScreen extends StatefulWidget {
  @override
  _CoinTossScreenState createState() => _CoinTossScreenState();
}

class _CoinTossScreenState extends State<CoinTossScreen> {
  bool _showFrontSide;
  bool _flipXAxis;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
    _flipXAxis = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coin Toss App"),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        child: Center(
          child: Container(
            child: _buildFlipAnimation(),
          ),
        ),
      ),
    );
  }

  void _changeRotationAxis() {
    setState(() {
      _flipXAxis = !_flipXAxis;
    });
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget, ...list]),
        child: _showFrontSide ? BuildHeadWidget() : BuildTailWidget(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }
}
