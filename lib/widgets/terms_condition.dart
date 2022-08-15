import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReusableTermsAndCondition extends StatelessWidget {
  final double padding;
  const ReusableTermsAndCondition({Key? key, required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "By signing up, you agree to our ",
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "Terms, Data Policy and Cockie Policy",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      log("privacy clicked");
                    },
                  style: const TextStyle(fontWeight: FontWeight.w600),
                )
              ])),
    );
  }
}
