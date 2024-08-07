import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _keyUsername = 'username';
  static const _keyEmail = 'email';
  static const _keyRole = 'role';

  static Future<void> saveUser(String username, String email, String roleName, int roleLevel) async {
    final prefs = await SharedPreferences.getInstance();

    final role = jsonEncode({
      'name': roleName,
      'level': roleLevel,
    });

    await prefs.setString(_keyUsername, username);
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyRole, role);
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final username = prefs.getString(_keyUsername);
    final email = prefs.getString(_keyEmail);
    final roleString = prefs.getString(_keyRole);

    if (username == null || email == null || roleString == null) {
      return null;
    }

    final role = jsonDecode(roleString);

    return {
      'username': username,
      'email': email,
      'role': role,
    };
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsername);
    await prefs.remove(_keyEmail);
    await prefs.remove(_keyRole);
  }
}
