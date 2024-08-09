import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kaizen/helper/responsive_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
       !ResponsiveWidget.isMobile(context) ?  Text(
            'suggestion'.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ):Container(),
          Image.asset(
            'assets/images/logo.png', // Update this path to your image location
            height: 40,
          ),
        ],
      ),
      actions: [
        LanguageDropdown(),
      ],
      backgroundColor: Colors.white,
      elevation: 0, // No shadow
    );
  }
}

class LanguageDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: DropdownButton<Locale>(
        underline: SizedBox(),
        icon: Icon(Icons.language, color: Colors.grey),
        items: const [
          DropdownMenuItem(
            value: Locale('en', 'US'),
            child: Text('English'),
          ),
          DropdownMenuItem(
            value: Locale('pt', 'BR'),
            child: Text('Português'),
          ),
        ],
        onChanged: (Locale? locale) {
          if (locale != null) {
            Get.updateLocale(locale);
          }
        },
        // hint: Text(
        //   'select_language'.tr,
        //   style: TextStyle(color: Colors.white),
        // ),
      ),
    );
  }
}
