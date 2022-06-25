import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      this.flex = 1,
      this.buttonColor,
      required this.textSpecialColor,
      required this.buttonTextWidget,
      this.width,
      this.isScientific = false,
      required this.onBtnClick,
      this.onBtnLongPress})
      : isText = (buttonTextWidget is String?) ? true : false,
        super(key: key);
  final int flex;
  final Color? buttonColor;
  final dynamic buttonTextWidget;
  final int textSpecialColor;
  final bool isText;
  final bool isScientific;
  final double? width;
  final void Function()? onBtnClick;
  final void Function()? onBtnLongPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: onBtnClick,
        onLongPress: onBtnLongPress,
        child: Container(
          margin: isScientific ? null : const EdgeInsets.all(10),
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: buttonColor,
          ),
          child: Center(
            child: GridTile(
              child: Padding(
                padding: isScientific
                    ? const EdgeInsets.all(5)
                    : const EdgeInsets.all(20),
                child: isText
                    ? Text(
                        buttonTextWidget,
                        style: TextStyle(
                          color: textSpecialColor == 1
                              ? Theme.of(context).primaryColorLight
                              : (textSpecialColor == 0
                                  ? Theme.of(context).secondaryHeaderColor
                                  : Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.color),
                          fontFamily: "Poppins",
                          fontSize: isScientific ? 20 : 25,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : Icon(
                        buttonTextWidget,
                        color: textSpecialColor == 1
                            ? Theme.of(context).primaryColorLight
                            : (textSpecialColor == 0
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.color),
                        size: isScientific ? 18 : 25,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
