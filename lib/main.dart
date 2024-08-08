import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kaizen/firebase_options.dart';
import 'package:kaizen/app.dart';
import 'package:kaizen/model/core.dart';
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

  final List<String> _areas = [
    'Serviços Laboratório',
    'Manufatura IA',
    'Administrativo - Operação',
    'Warehouse',
    'HSE',
    'Sistemas',
    'Administrativo',
    'Qualidade',
    'Serviços ADM',
    'Serviços Customer Service',
    'Engenharia',
  ];

  final List<String> _categorias = [
    'HSE',
    '5S',
    'GESTÃO VISUAL',
    'PRODUTIVIDADE',
    'QUALIDADE',
    'REDUÇÃO DE DESPERDÍCIOS',
    'INFRAESTRUTURA',
  ];

  final List<String> _subcategorias = [
    'Comportamento Inseguro',
    'Condição Insegura',
    'Defeitos',
    'Espera',
    'Estoque',
    'Kaizen',
    'Manuntenção / Reparo',
    'Movimentação',
    'Outros',
    'Quase Acidente',
    'Superprocessamento',
    'Superprodução',
    'Transporte'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
              height: 40,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: Center(
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
                              height: 300,
                              width: 300,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),
                      const Text('Cadastre sua sugestão',
                          style: TextStyle(fontSize: 30)),

                      const SizedBox(height: 16),

                      CustomTextFormField(
                          width: 300,
                          hintText: 'Digite o EID',
                          labelText: 'EID',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu EID';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _eid = value;
                          },
                          maxLines: 1),

                      const SizedBox(height: 16),

                      CustomDropdownButtonFormField(
                        width: 300,
                        value: _selectedArea,
                        hintText: 'Selecione a Área',
                        labelText: 'Área da CI',
                        items: _areas,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedArea = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Por favor, selecione uma área';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      CustomDropdownButtonFormField(
                        width: 300,
                        value: _selectedCategory,
                        hintText: 'Selecione a Área',
                        labelText: 'Categoria',
                        items: _categorias,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCategory = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Por favor, selecione uma categoria';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      CustomDropdownButtonFormField(
                        width: 300,
                        value: _selectedSubcategory,
                        hintText: 'Selecione uma subcategoria',
                        labelText: 'Subcategoria',
                        items: _subcategorias,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedSubcategory = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Por favor, selecione uma subcategoria';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // ),

                      CustomDropdownButtonFormField(
                        width: 300,
                        value: _selectedCandidate,
                        hintText: 'Selecione uma opção',
                        labelText: 'Candidata-se a resolver?',
                        items: const ['Sim', 'Não'],
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCandidate = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Por favor, selecione uma opção';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      CustomTextFormField(
                          // width: 600,
                          hintText: 'Digite  uma descrição do problema',
                          labelText: 'Descrição do Problema',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, descreva o problema';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _problemDescription = value;
                          },
                          maxLines: 8),

                      const SizedBox(height: 16),

                      CustomTextFormField(
                          // width: 600,
                          hintText: 'Digite  uma ação ou sugestão',
                          labelText: 'Ação ou Sugestão',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira sua sugestão';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _suggestion = value;
                          },
                          maxLines: 8),

                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Implement file picker
                                  },
                                  icon: const Icon(Icons.attach_file),
                                  label: const Text('Anexar Arquivo'),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Process data
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Enviando Sugestão...')),
                                      );
                                    }
                                  },
                                  child: const Text('Enviar'),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              //  mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    // Implement suggestion tracking
                                  },
                                  child: const Text('Acompanhar Sugestão'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 50),
                      const Divider(
                        color: Colors.grey, // Cor da linha
                        thickness: 1, // Espessura da linha
                      ),
                      const SizedBox(height: 50),
                      const Center(
                        child: Text('© Honeywell 2025'),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      )

      // SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.only(right: 500.0, left: 500.0),
      //     child: Form(
      //       key: _formKey,
      //       child:
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Center(
      //             child: Column(
      //               children: [
      //                 Image.asset(
      //                   'assets/images/kaizen_logo.jpg',
      //                   height: 300,
      //                   width: 300,
      //                 ),
      //                 SizedBox(height: 16),
      //               ],
      //             ),
      //           ),
      //           SizedBox(height: 32),
      //           Text('Cadastre sua sugestão', style: TextStyle(fontSize: 30)),
      //           SizedBox(height: 16),
      //
      //           CustomTextFormField(
      //               width: 300,
      //               hintText: 'Digite o EID',
      //               labelText: 'EID',
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Por favor, insira seu EID';
      //                 }
      //                 return null;
      //               },
      //               onChanged: (value) {
      //                 _eid = value;
      //               },
      //               maxLines: 1),
      //
      //           SizedBox(height: 16),
      //
      //           CustomDropdownButtonFormField(
      //             width: 300,
      //             value: _selectedArea,
      //             hintText: 'Selecione a Área',
      //             labelText: 'Área da CI',
      //             items: ['Área 1', 'Área 2', 'Área 3'],
      //             onChanged: (newValue) {
      //               setState(() {
      //                 _selectedArea = newValue;
      //               });
      //             },
      //             validator: (value) {
      //               if (value == null) {
      //                 return 'Por favor, selecione uma área';
      //               }
      //               return null;
      //             },
      //           ),
      //
      //           SizedBox(height: 16),
      //
      //           CustomDropdownButtonFormField(
      //             width: 300,
      //             value: _selectedCategory,
      //             hintText: 'Selecione a Área',
      //             labelText: 'Categoria',
      //             items: ['Categoria 1', 'Categoria 2', 'Categoria 3'],
      //             onChanged: (newValue) {
      //               setState(() {
      //                 _selectedCategory = newValue;
      //               });
      //             },
      //             validator: (value) {
      //               if (value == null) {
      //                 return 'Por favor, selecione uma categoria';
      //               }
      //               return null;
      //             },
      //           ),
      //
      //           SizedBox(height: 16),
      //
      //           CustomDropdownButtonFormField(
      //             width: 300,
      //             value: _selectedSubcategory,
      //             hintText: 'Selecione uma subcategoria',
      //             labelText: 'Subcategoria',
      //             items: ['Subcategoria 1', 'Subcategoria 2', 'Subcategoria 3'],
      //             onChanged: (newValue) {
      //               setState(() {
      //                 _selectedSubcategory = newValue;
      //               });
      //             },
      //             validator: (value) {
      //               if (value == null) {
      //                 return 'Por favor, selecione uma subcategoria';
      //               }
      //               return null;
      //             },
      //           ),
      //
      //           SizedBox(height: 16),
      //
      //           // ),
      //
      //           CustomDropdownButtonFormField(
      //             width: 300,
      //             value: _selectedCandidate,
      //             hintText: 'Selecione uma opção',
      //             labelText: 'Candidata-se a resolver?',
      //             items: ['Sim', 'Não'],
      //             onChanged: (newValue) {
      //               setState(() {
      //                 _selectedCandidate = newValue;
      //               });
      //             },
      //             validator: (value) {
      //               if (value == null) {
      //                 return 'Por favor, selecione uma opção';
      //               }
      //               return null;
      //             },
      //           ),
      //
      //           SizedBox(height: 16),
      //
      //           CustomTextFormField(
      //               width: 600,
      //               hintText: 'Digite  uma descrição do problema',
      //               labelText: 'Descrição do Problema',
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Por favor, descreva o problema';
      //                 }
      //                 return null;
      //               },
      //               onChanged: (value) {
      //                 _problemDescription = value;
      //               },
      //               maxLines: 10),
      //
      //           SizedBox(height: 16),
      //
      //           CustomTextFormField(
      //               width: 600,
      //               hintText: 'Digite  uma ação ou sugestão',
      //               labelText: 'Ação ou Sugestão',
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Por favor, insira sua sugestão';
      //                 }
      //                 return null;
      //               },
      //               onChanged: (value) {
      //                 _suggestion = value;
      //               },
      //               maxLines: 10),
      //
      //           SizedBox(height: 16),
      //
      //           ElevatedButton.icon(
      //             onPressed: () {
      //               // Implement file picker
      //             },
      //             icon: Icon(Icons.attach_file),
      //             label: Text('Anexar Arquivo'),
      //           ),
      //           SizedBox(height: 16),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               ElevatedButton(
      //                 onPressed: () {
      //                   if (_formKey.currentState!.validate()) {
      //                     // Process data
      //                     ScaffoldMessenger.of(context).showSnackBar(
      //                       SnackBar(content: Text('Enviando Sugestão...')),
      //                     );
      //                   }
      //                 },
      //                 child: Text('Enviar'),
      //               ),
      //               ElevatedButton(
      //                 onPressed: () {
      //                   // Implement suggestion tracking
      //                 },
      //                 child: Text('Acompanhar Sugestão'),
      //               ),
      //             ],
      //           ),
      //
      //           SizedBox(height: 50),
      //           const Divider(
      //             color: Colors.grey, // Cor da linha
      //             thickness: 1, // Espessura da linha
      //           ),
      //           SizedBox(height: 50),
      //           const Center(
      //             child: Text('© Honeywell 2025'),
      //           ),
      //           const SizedBox(
      //             height: 50,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // )

      ,
    );
  }
}
