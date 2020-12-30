import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static String contryName = 'contryName';
  static String isLogin = 'is_login';
  static String userId = 'user_id';
  static String fcmToken = 'fcm_token';
  static String lastSyncDate = 'last_sync_date';
  static String userName = 'user_name';
  static String userNumber= 'user_number';
  static String userEmail = 'user_email';
  static String userType = 'user_type';

  static SharedPreferences prefs;

  SharedPrefUtils();

  SharedPrefUtils.setString(key, value) {
    _setString(key, value);
  }

  SharedPrefUtils.setInt(key, value) {
    _setInt(key, value);
  }

  SharedPrefUtils.setBoolean(key, value) {
    getPref().whenComplete(() {
      _setBoolean(key, value);
    });
  }

  static Future<SharedPreferences> getPref() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  // string pref
  _setString(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getString(key) async {
    await getPref();
    String result  = await prefs.getString(key);
    return result;
  }

  // int pref
  _setInt(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<int> getInt(key) async {
    await getPref();
    int result = await prefs.getInt(key);
    return result??0;
  }

  // boolean pref
  _setBoolean(key, value) async {
    await prefs.setBool(key, value);
  }

  Future<bool> getBoolean(key) async {
    await getPref();
    bool result = await prefs.getBool(key);
    return result;
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove values
    prefs.remove(contryName);
  }
}
