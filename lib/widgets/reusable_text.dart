import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const ReusableText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
