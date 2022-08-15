import 'package:flutter/material.dart';

class FeedsImageContainer extends StatelessWidget {
  final String image;
  const FeedsImageContainer({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 200,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 3, color: Colors.white),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, -5),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }
}
