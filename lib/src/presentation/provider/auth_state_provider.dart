import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStateProvider with ChangeNotifier {
  bool _authStatus = false;

  bool get authStatus => _authStatus;

  Future<void> initialize() async {
    // Check for existing token in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    _authStatus =
        token != null ? true : false; // If token is not null, user is logged in
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    _authStatus = false;
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    _authStatus = true;
    notifyListeners();
  }
}
