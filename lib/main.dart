import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kaizen/firebase_options.dart';
import 'package:kaizen/app.dart';
import 'package:kaizen/helper/responsive_widget.dart';
import 'package:kaizen/model/core.dart';
import 'package:kaizen/views/desktop/suggestion_form_desktop.dart';
import 'package:kaizen/views/mobile/suggestion_form_mobile.dart';
import 'package:kaizen/widgets/custom_dropdown_button_form_field.dart';
import 'package:kaizen/widgets/custom_text_form_field.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   Core core = Core();
//   await core.setUserData();
//
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   runApp(const MyApp());
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.white,


        appBar: !ResponsiveWidget.isShorter(context)? AppBar(
          //elevation: 4.0,
          // shadowColor: Colors.grey.withOpacity(0.5), // Control shadow color
          // iconTheme: IconThemeData(color: Colors.black), // Set icon color to blac
          // backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Sugestão',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              // SizedBox(width: 100),

              Image.asset(
                'assets/images/logo.png',
                // Substitua pelo caminho correto da sua imagem
                height: 60,
              ),
            ],
          ),
        ) : AppBar(),

        body: ResponsiveWidget(
          mobile: SuggestionFormMobile(),
          // tablet: SuggestionFormDesktop(),
          desktop: SuggestionFormDesktop(),
        ),
      ),
    );
  }
}
