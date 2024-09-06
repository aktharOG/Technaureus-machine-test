import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class SharedPreferencesEntity {
  static final SharedPreferencesEntity _instance =
      SharedPreferencesEntity._internal();

  factory SharedPreferencesEntity() => _instance;

  SharedPreferencesEntity get instance => _instance;
  SharedPreferencesEntity._internal();

  Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getToken() async {
    final prefs = await _getInstance();
    return prefs.getString('token');
  }

  Future<void> setToken(String token) async {
    final prefs = await _getInstance();
    await prefs.setString('token', token);
  }

  Future<void> setFirebaseToken(String token) async {
    final prefs = await _getInstance();
    await prefs.setString('fcm_token', token);
  }

  Future<String?> getFirebaseToken() async {
    final prefs = await _getInstance();
    return prefs.getString('fcm_token');
  }

  Future<void> clearToken() async {
    final prefs = await _getInstance();
    await prefs.remove('token');
  }

  Future<String?> getAppLocale() async {
    final prefs = await _getInstance();
    return prefs.getString('appLocale');
  }

  Future<void> setAppLocale(String locale) async {
    final prefs = await _getInstance();
    await prefs.setString('appLocale', locale);
  }

  Future<void> saveWalletData(String data) async {
    final prefs = await _getInstance();
    await prefs.setString('walletData', data);
  }

  Future<String?> getWalletData() async {
    final prefs = await _getInstance();
    return prefs.getString('walletData');
  }
}
