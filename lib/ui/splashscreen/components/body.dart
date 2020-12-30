import 'package:flutter/material.dart';
import 'package:country_info/utils/color-utils.dart';
import 'package:country_info/utils/image_utils.dart';
import 'package:country_info/utils/string-utils.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buildLogoImageField() => Hero(
      tag: 'splash',
      child: Image.asset(
        ImageUtils.appLogo,
        height: 200.0,
        width: 200.0,
      ),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildLogoImageField(),
            /*Text(
              StringUtils.appName,
              style: TextStyle(color: ColorUtils.greenColor, fontSize: 40.0, fontFamily: 'Belleza'),
            ),*/
          ],
        ),
      ),
      //backgroundColor: ColorUtils.bgColor,
    );
  }
}