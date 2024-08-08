import 'package:flutter/material.dart';

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
          const Text(
            'Sugestão',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Image.asset(
            'assets/images/logo.png', // Update this path to your image location
            height: 60,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0, // No shadow
    );
  }
}
