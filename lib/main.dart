import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kaizen/firebase_options.dart';
import 'package:kaizen/helper/global_translations.dart';

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
    return GetMaterialApp(
      // Minhas traduções
      translations: GlobalTranslations(),
      // Definir o locale padrão
      locale: Get.deviceLocale,
      // Locale fallback
      fallbackLocale: Locale('pt', 'BR'),

      debugShowCheckedModeBanner: false,
      home:
          // Column(
          //   children: [
          //     Center(child: Text('hello'.tr)),
          //     ElevatedButton(
          //       onPressed: () {
          //         // Get.updateLocale(Locale('en', 'US'));
          //         Get.updateLocale(Locale('pt', 'BR'));
          //       },
          //       child: Text('Change to English'),
          //     ),
          //   ],
          // )
          Scaffold(
        backgroundColor: Colors.white,
        appBar: !ResponsiveWidget.isShorter(context)
            ? const CustomAppBar()
            : AppBar(),
        body: const ResponsiveWidget(
          mobile: SuggestionFormMobile(),
          desktop: SuggestionFormDesktop(),
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
