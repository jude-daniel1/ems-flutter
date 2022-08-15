import 'package:flutter/material.dart';
import 'package:task_managment_flutter/widgets/reusable_text.dart';

class AvaterText extends StatelessWidget {
  final String image;
  final String text;
  const AvaterText({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(
          width: 10,
        ),
        ReusableText(text: text, fontSize: 18, fontWeight: FontWeight.w700)
      ],
    );
  }
}
