import 'package:calculator/widgets/calculator/button_column.dart';
import 'package:calculator/widgets/global/custom_text_field.dart';
import 'package:flutter/material.dart';

class ScientificCalculator extends StatelessWidget {
  ScientificCalculator({Key? key}) : super(key: key);
  double _fontSize = 40;
  final TextEditingController _calculationController = TextEditingController();
  bool isRad = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextField(
                textController: _calculationController,
                bottomMargin: 5,
                fontSize: _fontSize,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            child: Row(
              children: [
                const ButtonColumn(
                  button1Text: "asin",
                  button2Text: "acos",
                  button3Text: "atan",
                  button4Text: "e^x",
                  button5Text: "10^x",
                  isScientific: true,
                ),
                const ButtonColumn(
                  button1Text: "sin",
                  button2Text: "cos",
                  button3Text: "tan",
                  button4Text: "ln",
                  button5Text: "log",
                  isScientific: true,
                ),
                const ButtonColumn(
                  button1Text: "pi",
                  button2Text: "x^y",
                  button3Text: "x!",
                  button4Text: "e",
                  button5Text: "(",
                  isScientific: true,
                ),
                ButtonColumn(
                  button1Text: "sqrt.",
                  button2Text: "sq.",
                  button3Text: "DEG",
                  button3SpecialColor: !isRad,
                  button4Text: "RAD",
                  button4SpecialColor: isRad,
                  button5Text: ")",
                  isScientific: true,
                ),
                const ButtonColumn(
                  button1Text: "C",
                  button1SpecialColor: true,
                  button2Text: "7",
                  button3Text: "4",
                  button4Text: "1",
                  button5Text: "%",
                  isScientific: true,
                ),
                const ButtonColumn(
                  button1Text: "/",
                  button1SpecialColor: true,
                  button2Text: "8",
                  button3Text: "5",
                  button4Text: "2",
                  button5Text: "0",
                  isScientific: true,
                ),
                const ButtonColumn(
                  button1Text: "X",
                  button1SpecialColor: true,
                  button2Text: "9",
                  button3Text: "6",
                  button4Text: "3",
                  button5Text: ".",
                  isScientific: true,
                ),
                const ButtonColumn(
                  button1Icon: Icons.backspace_outlined,
                  button1SpecialColor: true,
                  button2Text: "-",
                  button2SpecialColor: true,
                  button3Text: "+",
                  button3SpecialColor: true,
                  button4Text: "=",
                  button4SpecialColor: true,
                  button4IsLarge: true,
                  isScientific: true,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
