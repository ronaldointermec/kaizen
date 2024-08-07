import 'package:flutter/foundation.dart';
import 'package:kaizen/model/user_role.dart';
/* 
{
  "username": "Sparsh",
  "email": "sparsh@gmail.com",
  "role": {
    "name": "admin",
    "level": 3
  }
} */

@immutable
class User {
  final String username;
  final String email;
  final UserRole role;

  const User({required this.username, required this.email, required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      role: UserRole.fromJson(json['role']),
      // role: UserRole.fromJson(json['role']),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "username": username,
        "email": email,
        "role": role.toJason(),
      };

}

