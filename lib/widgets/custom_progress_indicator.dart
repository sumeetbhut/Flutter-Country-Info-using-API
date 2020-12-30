import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_info/theme/style.dart';
import 'package:country_info/utils/color-utils.dart';

class CustomProgressIndicator extends StatelessWidget {
  bool _loading;

  CustomProgressIndicator(this._loading);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Visibility(
      child: Container(
        alignment: AlignmentDirectional.center,
        decoration: new BoxDecoration(
          color: backgroundColor,
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: new SizedBox(
                height: 40.0,
                width: 40.0,
                child:  CircularProgressIndicator(
                  value: null,
                  strokeWidth: 3.0,
                ),
              ),
            ),
//            new Container(
//              margin: const EdgeInsets.only(top: 25.0),
//              child: new Center(
//                child: new Text(
//                  "Please wait...",
//                  style: new TextStyle(color: ColorUtils.textColor),
//                ),
//              ),
//            ),
          ],
        ),
      ),
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: _loading,
    );
  }
}

class CustomProgressLoginIndicator extends StatelessWidget {
  final bool _loading;

  CustomProgressLoginIndicator(this._loading);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Visibility(
      child: Container(
        alignment: AlignmentDirectional.center,
        decoration: new BoxDecoration(
          color: Colors.white70,
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: new SizedBox(
                height: 50.0,
                width: 50.0,
                child:  CircularProgressIndicator(
                  value: null,
                  strokeWidth: 7.0,
                ),
              ),
            ),
//            new Container(
//              margin: const EdgeInsets.only(top: 25.0),
//              child: new Center(
//                child: new Text(
//                  "Please wait...",
//                  style: new TextStyle(color: ColorUtils.textColor),
//                ),
//              ),
//            ),
          ],
        ),
      ),
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: _loading,
    );
    ;
  }
}
