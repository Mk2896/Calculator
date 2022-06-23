import 'dart:developer';

import 'package:calculator/models/calculations.dart';
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
    this.scrollController,
  }) : super(key: key);
  final double topMargin;
  final double bottomMargin;
  final double leftMargin;
  final double rightMargin;
  final TextEditingController? textController;
  final ScrollController? scrollController;
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        controller: textController,
        scrollController: scrollController,
        toolbarOptions: const ToolbarOptions(
          copy: false,
          cut: false,
          paste: false,
          selectAll: false,
        ),
        autofocus: true,
        cursorWidth: 4,
        cursorRadius: const Radius.circular(5),
        textAlign: TextAlign.end,
        cursorColor: Theme.of(context).primaryColorLight,
        keyboardType: TextInputType.none,
        style: TextStyle(
          color: Theme.of(context).secondaryHeaderColor,
          fontFamily: "Poppins",
          fontSize: fontSize,
        ),
        decoration: const InputDecoration.collapsed(
          hintText: "",
        ),
      ),
    );
  }
}
