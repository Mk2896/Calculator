import 'package:calculator/widgets/calculator/buttons.dart';
import 'package:flutter/material.dart';

class ButtonColumn extends StatelessWidget {
  const ButtonColumn({
    Key? key,
    this.button1Text,
    this.button1Icon,
    this.button2Text,
    this.button2Icon,
    this.button3Text,
    this.button3Icon,
    this.button4Text,
    this.button4Icon,
    this.button5Text,
    this.button5Icon,
    this.button4IsLarge = false,
    this.button1SpecialColor = false,
    this.button2SpecialColor = false,
    this.button3SpecialColor = false,
    this.button4SpecialColor = false,
    this.button5SpecialColor = false,
    this.isScientific = false,
  })  : assert(
          button1Text == null || button1Icon == null,
          'Cannot provide both a Text and a Icon.',
        ),
        assert(
          button2Text == null || button2Icon == null,
          'Cannot provide both a Text and a Icon.',
        ),
        assert(
          button3Text == null || button3Icon == null,
          'Cannot provide both a Text and a Icon.',
        ),
        assert(
          button4Text == null || button4Icon == null,
          'Cannot provide both a Text and a Icon.',
        ),
        assert(
          button5Text == null || button5Icon == null,
          'Cannot provide both a Text and a Icon.',
        ),
        assert(button1Text != null || button1Icon != null,
            "Either Text or Icon is required"),
        assert(button2Text != null || button2Icon != null,
            "Either Text or Icon is required"),
        assert(button3Text != null || button3Icon != null,
            "Either Text or Icon is required"),
        assert(button4Text != null || button4Icon != null,
            "Either Text or Icon is required"),
        assert(button4IsLarge || button5Text != null || button5Icon != null,
            "Either Text or Icon is required"),
        super(key: key);

  final String? button1Text;
  final String? button2Text;
  final String? button3Text;
  final String? button4Text;
  final String? button5Text;

  final IconData? button1Icon;
  final IconData? button3Icon;
  final IconData? button2Icon;
  final IconData? button4Icon;
  final IconData? button5Icon;

  final bool button1SpecialColor;
  final bool button2SpecialColor;
  final bool button3SpecialColor;
  final bool button4SpecialColor;
  final bool button5SpecialColor;

  final bool button4IsLarge;

  final bool isScientific;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyButton(
            buttonTextWidget: button1Text ?? button1Icon,
            textSpecialColor: button1SpecialColor ? 1 : 0,
            isScientific: isScientific,
          ),
          MyButton(
            buttonTextWidget: button2Text ?? button2Icon,
            textSpecialColor: button2SpecialColor ? 1 : 0,
            isScientific: isScientific,
          ),
          MyButton(
            buttonTextWidget: button3Text ?? button3Icon,
            textSpecialColor: button3SpecialColor ? 1 : 0,
            isScientific: isScientific,
          ),
          MyButton(
            buttonTextWidget: button4Text ?? button4Icon,
            textSpecialColor: button4IsLarge
                ? 2
                : button4SpecialColor
                    ? 1
                    : 0,
            buttonColor:
                button4IsLarge ? Theme.of(context).primaryColorLight : null,
            flex: button4IsLarge ? 2 : 1,
            isScientific: isScientific,
            width: button4IsLarge && isScientific
                ? MediaQuery.of(context).size.width * 0.05
                : null,
          ),
          if (!button4IsLarge) ...[
            MyButton(
              buttonTextWidget: button5Text ?? button5Icon,
              textSpecialColor: button5SpecialColor ? 1 : 0,
              isScientific: isScientific,
            ),
          ]
        ],
      ),
    );
  }
}
