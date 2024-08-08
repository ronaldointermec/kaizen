import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final double width;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.onChanged, required this.maxLines, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child:  TextFormField(

      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 20.0),
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
      validator: validator,
      onChanged: onChanged,
        maxLines: maxLines
    ));
  }
}