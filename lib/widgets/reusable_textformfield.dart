import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  final TextInputType textInputType;
  final String text;
  final TextEditingController controller;
  final IconData? iconData;
  const ReusableTextFormField(
      {Key? key,
      required this.textInputType,
      required this.text,
      required this.controller,
      this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: textInputType,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 8, left: 10),
          constraints: const BoxConstraints(
            maxHeight: 50,
          ),
          labelText: text,
          labelStyle: const TextStyle(fontSize: 18),
          prefixIcon: iconData != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(iconData),
                )
              : null,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE5E5E5), width: 0.9))),
    );
  }
}
