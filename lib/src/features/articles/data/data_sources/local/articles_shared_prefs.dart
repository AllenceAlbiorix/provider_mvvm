import 'package:shared_preferences/shared_preferences.dart';

class ArticlesSharedPrefs {
  // ignore: unused_field
  final SharedPreferences _preferences;

  ArticlesSharedPrefs(this._preferences);

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}
