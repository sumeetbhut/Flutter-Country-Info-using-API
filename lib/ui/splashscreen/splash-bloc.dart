import 'dart:async';

import 'package:country_info/bloc/bloc.dart';
import 'package:country_info/utils/shared-pref-utils.dart';

class SplashBloc extends Bloc {
  Stream<String> get stream => splashController.stream;

  Sink<String> get streamSink => splashController.sink;

  final StreamController<String> splashController = StreamController<String>();

  SplashBloc() {
    Timer(Duration(seconds: 2), () {
      splashController.add('/tabBottomScreen');
    });
  }

  void dispose() {
    splashController.close();
  }
}
