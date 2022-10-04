import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({super.key, this.controller, this.hintText, this.labelText, this.validator});

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: null,
      
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        alignLabelWithHint: true,
      ),
      
      validator: validator,
    );
  }
}