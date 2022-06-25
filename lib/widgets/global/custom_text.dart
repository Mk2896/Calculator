import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.topMargin = 0,
    this.bottomMargin = 0,
    this.leftMargin = 0,
    this.rightMargin = 0,
    this.height,
    this.width,
    this.alignment,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
  }) : super(key: key);
  final String text;
  final double topMargin;
  final double bottomMargin;
  final double leftMargin;
  final double rightMargin;
  final Alignment? alignment;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topMargin,
        bottom: bottomMargin,
        left: leftMargin,
        right: rightMargin,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontFamily: "Poppins",
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
