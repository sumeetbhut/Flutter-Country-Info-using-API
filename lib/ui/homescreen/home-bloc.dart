import 'dart:async';

import 'package:country_info/bloc/bloc.dart';
import 'package:country_info/model/CountryResponse.dart';
import 'package:country_info/repository/country_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc extends Bloc {
  // user login repo and behavior subject
  final CountryRepository _repository = CountryRepository();
  final CountryRepository _repositorySearch = CountryRepository();
  final BehaviorSubject<List<CountryResponse>> _subject = BehaviorSubject<List<CountryResponse>>();
  final BehaviorSubject<List<CountryResponse>> _subjectSearch = BehaviorSubject<List<CountryResponse>>();

  BehaviorSubject<List<CountryResponse>> get subject => _subject;
  BehaviorSubject<List<CountryResponse>> get subjectSearch => _subjectSearch;

  // login user function
  Future<List<CountryResponse>> countryList() async {
    List<CountryResponse> response = await _repository.countryList();
    _subject.sink.add(response);
  }

  Future<List<CountryResponse>> countryListSearch(String str) async {
    List<CountryResponse> response = await _repositorySearch.searchcountryList(str);
    _subjectSearch.sink.add(response);
  }
  void dispose() {
    _subject.close();
  }
}
