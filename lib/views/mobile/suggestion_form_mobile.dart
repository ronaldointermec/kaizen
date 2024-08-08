import 'package:flutter/material.dart';
import 'package:kaizen/widgets/custom_dropdown_button_form_field.dart';
import 'package:kaizen/widgets/custom_text_form_field.dart';

class SuggestionFormMobile extends StatefulWidget {
  @override
  _SuggestionFormMobileState createState() => _SuggestionFormMobileState();
}

class _SuggestionFormMobileState extends State<SuggestionFormMobile> {
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
    return Center(
      child: Container(
        width: 600,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/kaizen_logo.png',
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),

                // const SizedBox(height: 32),
                const Text('Cadastre sua sugestão',
                    style: TextStyle(fontSize: 30)),
                const Divider(
                  thickness: 1,
                ),
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
                     //width: 500,
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
                    // width: 500,
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Enviando Sugestão...')),
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
                  // color: Colors.grey, // Cor da linha
                  thickness: 1, // Espessura da linha
                ),
                const SizedBox(height: 50),
                const Center(
                  child: Text(
                    '© Honeywell 2025',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),

            // Form(
            //   key: _formKey,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Center(
            //         child: Column(
            //           children: [
            //             Image.asset(
            //               'assets/images/kaizen_logo.jpg',
            //               height: 300,
            //               width: 300,
            //             ),
            //             SizedBox(height: 16),
            //           ],
            //         ),
            //       ),
            //       SizedBox(height: 32),
            //       Text('Cadastre sua sugestão',
            //           style: TextStyle(fontSize: 30)),
            //       SizedBox(height: 16),
            //
            //       CustomTextFormField(
            //           width: 300,
            //           hintText: 'Digite o EID',
            //           labelText: 'EID',
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Por favor, insira seu EID';
            //             }
            //             return null;
            //           },
            //           onChanged: (value) {
            //             _eid = value;
            //           },
            //           maxLines: 1),
            //
            //       SizedBox(height: 16),
            //
            //       CustomDropdownButtonFormField(
            //         width: 300,
            //         value: _selectedArea,
            //         hintText: 'Selecione a Área',
            //         labelText: 'Área da CI',
            //         items: ['Área 1', 'Área 2', 'Área 3'],
            //         onChanged: (newValue) {
            //           setState(() {
            //             _selectedArea = newValue;
            //           });
            //         },
            //         validator: (value) {
            //           if (value == null) {
            //             return 'Por favor, selecione uma área';
            //           }
            //           return null;
            //         },
            //       ),
            //
            //       SizedBox(height: 16),
            //
            //       CustomDropdownButtonFormField(
            //         width: 300,
            //         value: _selectedCategory,
            //         hintText: 'Selecione a Área',
            //         labelText: 'Categoria',
            //         items: ['Categoria 1', 'Categoria 2', 'Categoria 3'],
            //         onChanged: (newValue) {
            //           setState(() {
            //             _selectedCategory = newValue;
            //           });
            //         },
            //         validator: (value) {
            //           if (value == null) {
            //             return 'Por favor, selecione uma categoria';
            //           }
            //           return null;
            //         },
            //       ),
            //
            //       SizedBox(height: 16),
            //
            //       CustomDropdownButtonFormField(
            //         width: 300,
            //         value: _selectedSubcategory,
            //         hintText: 'Selecione uma subcategoria',
            //         labelText: 'Subcategoria',
            //         items: [
            //           'Subcategoria 1',
            //           'Subcategoria 2',
            //           'Subcategoria 3'
            //         ],
            //         onChanged: (newValue) {
            //           setState(() {
            //             _selectedSubcategory = newValue;
            //           });
            //         },
            //         validator: (value) {
            //           if (value == null) {
            //             return 'Por favor, selecione uma subcategoria';
            //           }
            //           return null;
            //         },
            //       ),
            //
            //       SizedBox(height: 16),
            //
            //       // ),
            //
            //       CustomDropdownButtonFormField(
            //         width: 300,
            //         value: _selectedCandidate,
            //         hintText: 'Selecione uma opção',
            //         labelText: 'Candidata-se a resolver?',
            //         items: ['Sim', 'Não'],
            //         onChanged: (newValue) {
            //           setState(() {
            //             _selectedCandidate = newValue;
            //           });
            //         },
            //         validator: (value) {
            //           if (value == null) {
            //             return 'Por favor, selecione uma opção';
            //           }
            //           return null;
            //         },
            //       ),
            //
            //       const SizedBox(height: 16),
            //
            //       CustomTextFormField(
            //           width: 600,
            //           hintText: 'Digite  uma descrição do problema',
            //           labelText: 'Descrição do Problema',
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Por favor, descreva o problema';
            //             }
            //             return null;
            //           },
            //           onChanged: (value) {
            //             _problemDescription = value;
            //           },
            //           maxLines: 10),
            //
            //       const SizedBox(height: 16),
            //
            //       CustomTextFormField(
            //           width: 600,
            //           hintText: 'Digite  uma ação ou sugestão',
            //           labelText: 'Ação ou Sugestão',
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Por favor, insira sua sugestão';
            //             }
            //             return null;
            //           },
            //           onChanged: (value) {
            //             _suggestion = value;
            //           },
            //           maxLines: 10),
            //
            //       const SizedBox(height: 16),
            //
            //       ElevatedButton.icon(
            //         onPressed: () {
            //           // Implement file picker
            //         },
            //         icon: Icon(Icons.attach_file),
            //         label: Text('Anexar Arquivo'),
            //       ),
            //       const SizedBox(height: 16),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           ElevatedButton(
            //             onPressed: () {
            //               if (_formKey.currentState!.validate()) {
            //                 // Process data
            //                 ScaffoldMessenger.of(context).showSnackBar(
            //                   SnackBar(content: Text('Enviando Sugestão...')),
            //                 );
            //               }
            //             },
            //             child: Text('Enviar'),
            //           ),
            //           ElevatedButton(
            //             onPressed: () {
            //               // Implement suggestion tracking
            //             },
            //             child: Text('Acompanhar Sugestão'),
            //           ),
            //         ],
            //       ),
            //
            //       const SizedBox(height: 50),
            //       const Divider(
            //         color: Colors.grey, // Cor da linha
            //         thickness: 1, // Espessura da linha
            //       ),
            //       const SizedBox(height: 50),
            //       const Center(
            //         child: Text('© Honeywell 2025'),
            //       ),
            //       const SizedBox(
            //         height: 50,
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
