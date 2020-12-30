import 'package:country_info/model/CountryResponse.dart';
import 'package:country_info/repository/country_api_provider.dart';

class CountryRepository {
  final CountryApiProvider _apiProvider = CountryApiProvider();

  // Country list
  Future<List<CountryResponse>> countryList() => _apiProvider.countryList();

  Future<List<CountryResponse>> searchcountryList(String keyword) =>
      _apiProvider.searchCountryList(keyword);

  Future<CountryResponse> detailCountry(String keyword) =>
      _apiProvider.detailCountry(keyword);
}
