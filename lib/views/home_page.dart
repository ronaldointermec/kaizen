import 'package:flutter/material.dart';
import 'package:kaizen/helper/responsive_widget.dart';
import 'package:kaizen/views/desktop/suggestion_form_desktop.dart';
import 'package:kaizen/views/mobile/suggestion_form_mobile.dart';
import 'package:kaizen/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: ResponsiveWidget(
        mobile: SuggestionFormMobile(),
        desktop: SuggestionFormDesktop(),
      ),
    );
  }
}
