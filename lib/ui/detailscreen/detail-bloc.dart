import 'dart:async';

import 'package:country_info/bloc/bloc.dart';
import 'package:country_info/model/CountryResponse.dart';
import 'package:country_info/repository/country_repository.dart';
import 'package:rxdart/rxdart.dart';

class DetailScreenBloc extends Bloc {
  // user login repo and behavior subject
  final CountryRepository _repository = CountryRepository();
  final BehaviorSubject<CountryResponse> _subject = BehaviorSubject<CountryResponse>();

  BehaviorSubject<CountryResponse> get subject => _subject;

  // login user function
  Future<CountryResponse> countryDetail(String str) async {
    CountryResponse response = await _repository.detailCountry(str);
    _subject.sink.add(response);
  }

  void dispose() {
    _subject.close();
  }
}
