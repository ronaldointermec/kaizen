import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kaizen/firebase_options.dart';
import 'package:kaizen/helper/responsive_widget.dart';
import 'package:kaizen/views/desktop/suggestion_form_desktop.dart';
import 'package:kaizen/views/mobile/suggestion_form_mobile.dart';
import 'package:kaizen/widgets/custom_app_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Core core = Core();
  // await core.setUserData();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: !ResponsiveWidget.isShorter(context)
            ? const CustomAppBar()
            : AppBar(),
        body: const ResponsiveWidget(
          mobile: SuggestionFormMobile(),
          desktop: SuggestionFormDesktop(),
        ),
      ),
    );
  }
}
