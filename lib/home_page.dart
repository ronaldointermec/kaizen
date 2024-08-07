import 'package:flutter/material.dart';
import 'package:kaizen/helper/role_handlers.dart';
import 'package:kaizen/message_button.dart';

import 'model/user_role.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: const WidgetWithRole(
          allowedRoles: [
            UserRole.admin,
            UserRole.manager,
            UserRole.user,
          ],
          child: Messagebutton(),
        ),
      ),
    );
  }
}
