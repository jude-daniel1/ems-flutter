import 'package:flutter/material.dart';

class ReusableElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  const ReusableElevatedButton(
      {Key? key, required this.text, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xFF274560),
            minimumSize: Size(size.width, 50)),
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}
