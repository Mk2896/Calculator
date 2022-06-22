import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.topMargin = 0,
    this.bottomMargin = 0,
    this.leftMargin = 0,
    this.rightMargin = 0,
    this.fontSize,
    required this.textController,
  }) : super(key: key);
  final double topMargin;
  final double bottomMargin;
  final double leftMargin;
  final double rightMargin;
  final TextEditingController? textController;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topMargin,
        bottom: bottomMargin,
        left: leftMargin,
        right: rightMargin,
      ),
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: textController,
        autofocus: true,
        cursorWidth: 4,
        cursorRadius: const Radius.circular(5),
        textDirection: TextDirection.rtl,
        cursorColor: Theme.of(context).primaryColorLight,
        keyboardType: TextInputType.none,
        style: TextStyle(
          color: Theme.of(context).secondaryHeaderColor,
          fontFamily: "Poppins",
          fontSize: fontSize,
        ),
        decoration: const InputDecoration.collapsed(hintText: ""),
      ),
    );
  }
}
