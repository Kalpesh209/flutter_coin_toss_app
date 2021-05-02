import 'package:flutter/material.dart';
import 'package:flutter_coin_toss_app/screen/widget/build_layout_widget.dart';

/*
Title:BuildHeadWidget
Purpose:BuildHeadWidget
Created By:Kalpesh Khandla
*/

class BuildHeadWidget extends StatelessWidget {
  BuildHeadWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildLayoutWidget(
      coinImg: "assets/images/head.jpg",
      faceName: "Head",
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
