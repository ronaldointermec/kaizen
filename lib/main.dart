import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kaizen/firebase_options.dart';
import 'package:kaizen/app.dart';
import 'package:kaizen/model/core.dart';

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
      home: SuggestionForm(),
    );
  }
}

class SuggestionForm extends StatefulWidget {
  @override
  _SuggestionFormState createState() => _SuggestionFormState();
}

class _SuggestionFormState extends State<SuggestionForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedArea;
  String? _selectedCategory;
  String? _selectedSubcategory;
  String? _selectedCandidate;
  String? _eid;
  String? _problemDescription;
  String? _suggestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Sugestão',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.grey),),
            // SizedBox(width: 100),
            Image.asset(
              'assets/images/logo.png',
              // Substitua pelo caminho correto da sua imagem
              height: 40,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 500.0, left: 500.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/kaizen_logo.jpg',
                        height: 400,
                        width: 400,
                      ),
                      SizedBox(height: 16),
                      // Text(
                      //   'PROGRAMA KAIZEN\nS&PS',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text('Cadastre sua sugestão', style: TextStyle(fontSize: 30)),
                SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Digite o EID',
                    labelText: 'EID',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu EID';
                    }
                    return null;
                  },
                  onChanged: (value) => _eid = value,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(

                  value: _selectedArea,
                  decoration: //InputDecoration(labelText: 'Área da CI'),
                  const InputDecoration(
                    // hintText: 'Selecione a Área',
                    labelText: 'Área da CI',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  items: ['Área 1', 'Área 2', 'Área 3'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) =>
                      setState(() => _selectedArea = newValue),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, selecione uma área';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: InputDecoration(labelText: 'Categoria'),
                  items: ['Categoria 1', 'Categoria 2', 'Categoria 3']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) =>
                      setState(() => _selectedCategory = newValue),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, selecione uma categoria';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedSubcategory,
                  decoration: InputDecoration(labelText: 'Subcategoria'),
                  items: ['Subcategoria 1', 'Subcategoria 2', 'Subcategoria 3']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) =>
                      setState(() => _selectedSubcategory = newValue),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, selecione uma subcategoria';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCandidate,
                  decoration:
                      InputDecoration(labelText: 'Candidata-se a resolver?'),
                  items: ['Sim', 'Não'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) =>
                      setState(() => _selectedCandidate = newValue),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, selecione uma opção';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Descrição do Problema'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, descreva o problema';
                    }
                    return null;
                  },
                  onChanged: (value) => _problemDescription = value,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Ação ou Sugestão'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua sugestão';
                    }
                    return null;
                  },
                  onChanged: (value) => _suggestion = value,
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement file picker
                  },
                  icon: Icon(Icons.attach_file),
                  label: Text('Anexar Arquivo'),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process data
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Enviando Sugestão...')),
                          );
                        }
                      },
                      child: Text('Enviar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement suggestion tracking
                      },
                      child: Text('Acompanhar Sugestão'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
