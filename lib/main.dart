import 'package:flutter/material.dart';
import 'package:country_info/routes.dart';
import 'package:country_info/theme/style.dart';
import 'package:country_info/utils/lifecucle-manager.dart';
import 'package:country_info/utils/string-utils.dart';

import 'bloc/bloc-prov-tree.dart';
import 'bloc/bloc-prov.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProviderTree(
      blocProviders: <BlocProvider>[],
      child: LifeCycleManager(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: StringUtils.appName,
            theme: appTheme(),
            initialRoute: '/',
            routes: routes),
      ),
    );
  }
}
