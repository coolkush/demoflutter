import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppPara extends StatelessWidget {
  double size;
  FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign? align;

  AppPara({
    Key? key,
    required this.fontWeight,
    required this.size,
    required this.text,
    this.color = Colors.white,
    this.align = TextAlign.justify,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: align,
        style: TextStyle(
            fontFamily: "Poppins",
            color: color,
            fontSize: size,
            fontWeight: fontWeight));
  }
}
