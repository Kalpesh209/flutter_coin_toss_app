import 'package:flutter/material.dart';
import 'package:flutter_coin_toss_app/screen/widget/build_layout_widget.dart';

/*
Title:BuildTailWidget
Purpose:BuildTailWidget
Created By:Kalpesh Khandla
*/

class BuildTailWidget extends StatelessWidget {
  BuildTailWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildLayoutWidget(
      coinImg: "assets/images/tail.jpg",
      faceName: "Tail",
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.white,
            BlendMode.srcATop,
          ),
          child: Center(
            child: Text(
              "Flutter",
              style: TextStyle(fontSize: 50.0),
            ),
          ),
        ),
      ),
    );
  }
}
