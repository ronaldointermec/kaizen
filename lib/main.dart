import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kaizen/firebase_options.dart';

import 'package:get/get.dart';

import 'package:kaizen/helper/global_translations.dart';
import 'package:kaizen/views/home_page.dart';

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
      title: 'title'.tr,
      // Minhas traduções
      translations: GlobalTranslations(),
      // Definir o locale padrão
      locale: Get.deviceLocale,
      // Locale fallback
      fallbackLocale: Locale('en', 'US'),

      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // TestTranlastion(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

// class TestTranlastion extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Internationalization with Get'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('hello'.tr), // Usar tradução
//             SizedBox(height: 16,),
//             Text('welcome'.tr), // Usar tradução
//             SizedBox(height: 16,),
//             ElevatedButton(
//               onPressed: () {
//                 // Mudar o idioma para português
//                 Get.updateLocale(Locale('pt', 'BR'));
//               },
//               child: Text('Change to Portuguese'),
//             ),
//             SizedBox(height: 16,),
//             ElevatedButton(
//               onPressed: () {
//                 // Mudar o idioma para inglês
//                 Get.updateLocale(Locale('en', 'US'));
//               },
//               child: Text('Change to English'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
