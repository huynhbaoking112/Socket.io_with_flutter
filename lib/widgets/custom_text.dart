// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {


  final String text;
  final List<Shadow> shadows ;
  final double fontsize;

  const CustomText({
    Key? key,
    required this.text,
    required this.shadows,
    required this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        shadows: shadows,
      ),
    );
  }
}
