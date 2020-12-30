import 'dart:convert';

import 'package:country_info/model/CountryResponse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:country_info/utils/logging_interceptor.dart';
import 'package:country_info/utils/shared-pref-utils.dart';

class CountryApiProvider {
  final String _endpoint = "https://restcountries.eu/rest/v2/";
  Dio _dio;

  CountryApiProvider() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 10000, connectTimeout: 10000);
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
  }

  //CountryList API
  List<CountryResponse> _postList =new List<CountryResponse>();
  Future<List<CountryResponse>> countryList() async {
    String url = "all";

    http.Response response = await http.get(
      _endpoint + url,
    );
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values = new List<dynamic>();
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            debugPrint('Name-------${map['name']}');
            _postList .add(CountryResponse.fromMap(map));
          }
        }
      }
      return _postList;
    }
  }

  // Country Search API
  List<CountryResponse> _postListSearch =new List<CountryResponse>();
  Future<List<CountryResponse>> searchCountryList(String keyword) async {
    http.Response response = await http.get(
      _endpoint + 'name/'+keyword+'?fullText=false',
    );
    /*Response response = await _dio.get(
      _endpoint + 'name/'+keyword+'?fullText=false',
    );*/
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        List<dynamic> values = new List<dynamic>();
        values = json.decode(response.body);
        if (values.length > 0) {
          for (int i = 0; i < values.length; i++) {
            if (values[i] != null) {
              Map<String, dynamic> map = values[i];
              debugPrint('Name-------${map['name']}');
              _postListSearch .add(CountryResponse.fromMap(map));
            }
          }
        }
        return _postListSearch;
      }
  }

  // Country Detail API
  Future<CountryResponse> detailCountry(String country) async {
    /*http.Response response = await http.get(
      _endpoint + 'alpha/'+country,
    );*/
    String contryName = await SharedPrefUtils().getString(SharedPrefUtils.contryName);
    Response response = await _dio.get(
      _endpoint + 'alpha/'+contryName,
    );
    if (response.statusCode == 200) {
      return CountryResponse.fromMap(response.data);
    }
  }

  String _handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          var errorMessage = (error.response.data["message"]);
          errorDescription = errorDescription + errorMessage;
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
