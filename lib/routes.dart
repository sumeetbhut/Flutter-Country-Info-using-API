import 'package:flutter/widgets.dart';
import 'package:country_info/ui/homescreen/homescreen.dart';
import 'package:country_info/ui/detailscreen/detailscreen.dart';
import 'package:country_info/ui/splashscreen/splashscreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => SplashScreen(),
  "/tabBottomScreen" : (BuildContext context) => HomeScreen(),
  "/detailScreen" : (BuildContext context) => DetailScreen(),
};
