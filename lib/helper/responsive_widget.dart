import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;

  // final Widget tablet;
  final Widget desktop;

  ResponsiveWidget({
    required this.mobile,
    // required this.tablet,
    required this.desktop,
  });

  // This is where the layout decision is made based on the screen width.

  static bool isShorter(BuildContext context) =>
      MediaQuery.of(context).size.width < 400;

  // static bool isMobile(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 600;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width > 400 &&
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    print(
        '${MediaQuery.of(context).size.width} - ##################################################');
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      // return tablet;
      return mobile;
    } else if (isMobile(context)) {
      return mobile;
    }  else {
      return Container();
    }
  }
}
