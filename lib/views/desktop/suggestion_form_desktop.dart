import 'package:flutter/material.dart';
import 'package:kaizen/widgets/custom_dropdown_button_form_field.dart';
import 'package:kaizen/widgets/custom_text_form_field.dart';


class SuggestionFormDesktop extends StatefulWidget {
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
    return


      SingleChildScrollView(
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
                      const Text('Cadastre sua sugestão',
                          style: TextStyle(fontSize: 30)),
                      Divider(thickness: 1,),
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
                        // color: Colors.grey, // Cor da linha
                        thickness: 1, // Espessura da linha
                      ),
                      const SizedBox(height: 50),
                      const Center(
                        child: Text('© Honeywell 2025', style: TextStyle(
                            fontSize: 20),),
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
