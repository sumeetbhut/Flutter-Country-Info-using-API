/// name : "Afghanistan"
/// topLevelDomain : [".af"]
/// alpha2Code : "AF"
/// alpha3Code : "AFG"
/// callingCodes : ["93"]
/// capital : "Kabul"
/// altSpellings : ["AF","Af??nist?n"]
/// region : "Asia"
/// subregion : "Southern Asia"
/// population : 27657145
/// latlng : [33.0,65.0]
/// demonym : "Afghan"
/// area : 652230.0
/// gini : 27.8
/// timezones : ["UTC+04:30"]
/// borders : ["IRN","PAK","TKM","UZB","TJK","CHN"]
/// nativeName : "?????????"
/// numericCode : "004"
/// currencies : [{"code":"AFN","name":"Afghan afghani","symbol":"?"}]
/// languages : [{"iso639_1":"ps","iso639_2":"pus","name":"Pashto","nativeName":"????"},{"iso639_1":"uz","iso639_2":"uzb","name":"Uzbek","nativeName":"O?zbek"},{"iso639_1":"tk","iso639_2":"tuk","name":"Turkmen","nativeName":"Türkmen"}]
/// translations : {"de":"Afghanistan","es":"Afganistán","fr":"Afghanistan","ja":"???????","it":"Afghanistan","br":"Afeganistão","pt":"Afeganistão","nl":"Afghanistan","hr":"Afganistan","fa":"?????????"}
/// flag : "https://restcountries.eu/data/afg.svg"
/// regionalBlocs : [{"acronym":"SAARC","name":"South Asian Association for Regional Cooperation","otherAcronyms":[],"otherNames":[]}]
/// cioc : "AFG"

class CountryResponse {
  String name;
  List<String> topLevelDomain;
  String alpha2Code;
  String alpha3Code;
  List<String> callingCodes;
  String capital;
  List<String> altSpellings;
  String region;
  String subregion;
  int population;
  List<double> latlng;
  String demonym;
  double area;
  double gini;
  List<String> timezones;
  List<String> borders;
  String nativeName;
  String numericCode;
  List<CurrenciesBean> currencies;
  List<LanguagesBean> languages;
  TranslationsBean translations;
  String flag;
  List<RegionalBlocsBean> regionalBlocs;
  String cioc;

  static CountryResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CountryResponse countryResponseBean = CountryResponse();
    countryResponseBean.name = map['name'];
    countryResponseBean.topLevelDomain = List()..addAll(
        (map['topLevelDomain'] as List ?? []).map((o) => o.toString())
    );
    countryResponseBean.alpha2Code = map['alpha2Code'];
    countryResponseBean.alpha3Code = map['alpha3Code'];
    countryResponseBean.callingCodes = List()..addAll(
        (map['callingCodes'] as List ?? []).map((o) => o.toString())
    );
    countryResponseBean.capital = map['capital'];
    countryResponseBean.altSpellings = List()..addAll(
        (map['altSpellings'] as List ?? []).map((o) => o.toString())
    );
    countryResponseBean.region = map['region'];
    countryResponseBean.subregion = map['subregion'];
    countryResponseBean.population = map['population'];
    countryResponseBean.latlng = List()..addAll(
        (map['latlng'] as List ?? []).map((o) => double.tryParse(o.toString()))
    );
    countryResponseBean.demonym = map['demonym'];
    countryResponseBean.area = map['area'];
    countryResponseBean.gini = map['gini'];
    countryResponseBean.timezones = List()..addAll(
        (map['timezones'] as List ?? []).map((o) => o.toString())
    );
    countryResponseBean.borders = List()..addAll(
        (map['borders'] as List ?? []).map((o) => o.toString())
    );
    countryResponseBean.nativeName = map['nativeName'];
    countryResponseBean.numericCode = map['numericCode'];
    countryResponseBean.currencies = List()..addAll(
        (map['currencies'] as List ?? []).map((o) => CurrenciesBean.fromMap(o))
    );
    countryResponseBean.languages = List()..addAll(
        (map['languages'] as List ?? []).map((o) => LanguagesBean.fromMap(o))
    );
    countryResponseBean.translations = TranslationsBean.fromMap(map['translations']);
    countryResponseBean.flag = map['flag'];
    countryResponseBean.regionalBlocs = List()..addAll(
        (map['regionalBlocs'] as List ?? []).map((o) => RegionalBlocsBean.fromMap(o))
    );
    countryResponseBean.cioc = map['cioc'];
    return countryResponseBean;
  }

  Map toJson() => {
    "name": name,
    "topLevelDomain": topLevelDomain,
    "alpha2Code": alpha2Code,
    "alpha3Code": alpha3Code,
    "callingCodes": callingCodes,
    "capital": capital,
    "altSpellings": altSpellings,
    "region": region,
    "subregion": subregion,
    "population": population,
    "latlng": latlng,
    "demonym": demonym,
    "area": area,
    "gini": gini,
    "timezones": timezones,
    "borders": borders,
    "nativeName": nativeName,
    "numericCode": numericCode,
    "currencies": currencies,
    "languages": languages,
    "translations": translations,
    "flag": flag,
    "regionalBlocs": regionalBlocs,
    "cioc": cioc,
  };
}

/// acronym : "SAARC"
/// name : "South Asian Association for Regional Cooperation"
/// otherAcronyms : []
/// otherNames : []

class RegionalBlocsBean {
  String acronym;
  String name;
  List<dynamic> otherAcronyms;
  List<dynamic> otherNames;

  static RegionalBlocsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    RegionalBlocsBean regionalBlocsBean = RegionalBlocsBean();
    regionalBlocsBean.acronym = map['acronym'];
    regionalBlocsBean.name = map['name'];
    regionalBlocsBean.otherAcronyms = map['otherAcronyms'];
    regionalBlocsBean.otherNames = map['otherNames'];
    return regionalBlocsBean;
  }

  Map toJson() => {
    "acronym": acronym,
    "name": name,
    "otherAcronyms": otherAcronyms,
    "otherNames": otherNames,
  };
}

/// de : "Afghanistan"
/// es : "Afganistán"
/// fr : "Afghanistan"
/// ja : "???????"
/// it : "Afghanistan"
/// br : "Afeganistão"
/// pt : "Afeganistão"
/// nl : "Afghanistan"
/// hr : "Afganistan"
/// fa : "?????????"

class TranslationsBean {
  String de;
  String es;
  String fr;
  String ja;
  String it;
  String br;
  String pt;
  String nl;
  String hr;
  String fa;

  static TranslationsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    TranslationsBean translationsBean = TranslationsBean();
    translationsBean.de = map['de'];
    translationsBean.es = map['es'];
    translationsBean.fr = map['fr'];
    translationsBean.ja = map['ja'];
    translationsBean.it = map['it'];
    translationsBean.br = map['br'];
    translationsBean.pt = map['pt'];
    translationsBean.nl = map['nl'];
    translationsBean.hr = map['hr'];
    translationsBean.fa = map['fa'];
    return translationsBean;
  }

  Map toJson() => {
    "de": de,
    "es": es,
    "fr": fr,
    "ja": ja,
    "it": it,
    "br": br,
    "pt": pt,
    "nl": nl,
    "hr": hr,
    "fa": fa,
  };
}

/// iso639_1 : "ps"
/// iso639_2 : "pus"
/// name : "Pashto"
/// nativeName : "????"

class LanguagesBean {
  String iso6391;
  String iso6392;
  String name;
  String nativeName;

  static LanguagesBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LanguagesBean languagesBean = LanguagesBean();
    languagesBean.iso6391 = map['iso639_1'];
    languagesBean.iso6392 = map['iso639_2'];
    languagesBean.name = map['name'];
    languagesBean.nativeName = map['nativeName'];
    return languagesBean;
  }

  Map toJson() => {
    "iso639_1": iso6391,
    "iso639_2": iso6392,
    "name": name,
    "nativeName": nativeName,
  };
}

/// code : "AFN"
/// name : "Afghan afghani"
/// symbol : "?"

class CurrenciesBean {
  String code;
  String name;
  String symbol;

  static CurrenciesBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CurrenciesBean currenciesBean = CurrenciesBean();
    currenciesBean.code = map['code'];
    currenciesBean.name = map['name'];
    currenciesBean.symbol = map['symbol'];
    return currenciesBean;
  }

  Map toJson() => {
    "code": code,
    "name": name,
    "symbol": symbol,
  };
}