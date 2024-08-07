import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kaizen/services/user_services.dart';

class Messagebutton extends StatefulWidget {
  const Messagebutton({super.key});

  @override
  State<Messagebutton> createState() => _MessagebuttonState();
}

class _MessagebuttonState extends State<Messagebutton> {

  @override
  Widget build(BuildContext context) {

    return TextButton(onPressed: _showMessage, child: const Text('Show me'));
  }

  _showMessage() {
    UserServices.addUser();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('I am role based'),
    ));
  }
}
