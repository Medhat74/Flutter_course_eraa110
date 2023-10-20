import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({Key? key, required this.text, required this.isBold, required this.size, required this.color}) : super(key: key);
  final String text;
  final bool isBold;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text (
        text,
      style: TextStyle(
        fontWeight: isBold? FontWeight.bold: FontWeight.normal,
        fontSize: size,
        color: color,
      ),
    );
  }
}
