import 'package:flutter/material.dart';
import 'package:kaizen/model/core.dart';
import 'package:kaizen/model/user_role.dart';

class WidgetWithRole extends StatefulWidget {
  const WidgetWithRole(
      {super.key, required this.child, required this.allowedRoles});

  final Widget child;
  final List<UserRole> allowedRoles;

  @override
  State<WidgetWithRole> createState() => _WidgetWithRoleState();
}

class _WidgetWithRoleState extends State<WidgetWithRole> {
  late Core core;

  @override
  void initState() {
    core = Core();
     super.initState();
  }

  bool get isAllowed => widget.allowedRoles.contains(core.user?.role);

  @override
  Widget build(BuildContext context) {
    if (isAllowed) {
      return widget.child;
    }
    return const Center(
      child: Text('I am not an admin'),
    );
  }
}
