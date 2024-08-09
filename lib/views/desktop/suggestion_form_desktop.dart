import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/widgets/custom_dropdown_button_form_field.dart';
import 'package:kaizen/widgets/custom_text_form_field.dart';

class SuggestionFormDesktop extends StatefulWidget {
  const SuggestionFormDesktop({super.key});

  @override
  _SuggestionFormDesktopState createState() => _SuggestionFormDesktopState();
}

class _SuggestionFormDesktopState extends State<SuggestionFormDesktop> {
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
    return SingleChildScrollView(
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
                            'assets/images/kaizen_logo.png',
                            height: 300,
                            width: 300,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),

                    // const SizedBox(height: 32),
                    Text('suggestion_register'.tr,
                        style:const TextStyle(fontSize: 30,color: Colors.grey)),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(height: 16),

                    CustomTextFormField(
                        width: 300,
                        hintText: 'hint_eid'.tr,
                        labelText: 'EID',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'validator_eid'.tr;
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
                      hintText: 'hint_area'.tr,
                      labelText: 'label_area'.tr,
                      items: _areas,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedArea = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'validator_area'.tr;
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    CustomDropdownButtonFormField(
                      width: 300,
                      value: _selectedCategory,
                      hintText: 'hint_category'.tr,
                      labelText: 'label_category'.tr,
                      items: _categorias,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategory = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'validator_category'.tr;
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    CustomDropdownButtonFormField(
                      width: 300,
                      value: _selectedSubcategory,
                      hintText: 'hint_subcategory'.tr,
                      labelText: 'label_subcategory'.tr,
                      items: _subcategorias,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedSubcategory = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'validator_subcategory'.tr;
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // ),

                    CustomDropdownButtonFormField(
                      width: 300,
                      value: _selectedCandidate,
                      hintText: 'hint_option'.tr,
                      labelText: 'label_option'.tr,
                      items: ['yes'.tr, 'no'.tr],
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCandidate = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'validator_option'.tr;
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    CustomTextFormField(
                        // width: 600,
                        hintText: 'hint_description'.tr,
                        labelText: 'label_description'.tr,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'validator_description'.tr;
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
                        hintText: 'hint_action'.tr,
                        labelText: 'label_action'.tr,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'validator_action'.tr;
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
                                label: Text('label_ttach_image'.tr),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Process data
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('snack_send_suggestion'.tr)),
                                    );
                                  }
                                },
                                child: Text('button_send'.tr),
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
                                child: Text('button_suggestion'.tr),
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
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
