import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final String? value;
  final String hintText;
  final String labelText;
  final List<String> items;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChanged;
  final double width;

  const CustomDropdownButtonFormField({
    Key? key,
    this.value,
    required this.hintText,
    required this.labelText,
    required this.items,
    this.validator,
    this.onChanged,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
        ));
  }
}
