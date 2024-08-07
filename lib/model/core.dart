import 'dart:convert' show jsonDecode;
import 'package:flutter/services.dart' show rootBundle;
import 'package:kaizen/model/user.dart';


import '../helper/user_preferences.dart';

class Core {

  static User? _user;

  User? get user => _user;
  
  Future<void> setUserData() async {



    // Save user data
     await UserPreferences.saveUser('Sparsh', 'sparsh@gmail.com', 'admin', 3);

    // Retrieve user data
    final userFromSharedPreferences = await UserPreferences.getUser();
    if (userFromSharedPreferences != null) {
     _user = User.fromJson(userFromSharedPreferences);

    } else {
      print('No user data found');
    }

    // // Clear user data
    // await UserPreferences.clearUser();
  }
}
