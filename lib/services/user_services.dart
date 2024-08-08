import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaizen/model/user.dart';

import 'package:kaizen/model/user_role.dart';

class UserServices {
  static Future<void> addUser() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference users = db.collection('users');
    // Call the user's CollectionReference to add a new user

    User user = const User(
        username: "Lorena Oliveira Silva",
        email: "Lorena@honeywell.com",
        role: UserRole.manager);
    print('############################### ${user.toJson()}');
    return users
        .add(user.toJson())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
