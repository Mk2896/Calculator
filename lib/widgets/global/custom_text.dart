import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.topMargin = 0,
    this.bottomMargin = 0,
    this.leftMargin = 0,
    this.rightMargin = 0,
  }) : super(key: key);
  final String text;
  final double topMargin;
  final double bottomMargin;
  final double leftMargin;
  final double rightMargin;
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
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).textTheme.titleMedium?.color,
          fontSize: 25,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
