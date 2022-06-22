import 'package:calculator/widgets/calculator/button_column.dart';
import 'package:calculator/widgets/global/custom_text_field.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key);
  double _fontSize = 50;
  final TextEditingController _calculationController = TextEditingController();

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
              children: const [
                
                ButtonColumn(
                  button1Text: "C",
                  button1SpecialColor: true,
                  button2Text: "7",
                  button3Text: "4",
                  button4Text: "1",
                  button5Text: "%",
                ),
                ButtonColumn(
                  button1Text: "/",
                  button1SpecialColor: true,
                  button2Text: "8",
                  button3Text: "5",
                  button4Text: "2",
                  button5Text: "0",
                ),
                ButtonColumn(
                  button1Text: "X",
                  button1SpecialColor: true,
                  button2Text: "9",
                  button3Text: "6",
                  button4Text: "3",
                  button5Text: ".",
                ),
                ButtonColumn(
                  button1Icon: Icons.backspace_outlined,
                  button1SpecialColor: true,
                  button2Text: "-",
                  button2SpecialColor: true,
                  button3Text: "+",
                  button3SpecialColor: true,
                  button4Text: "=",
                  button4SpecialColor: true,
                  button4IsLarge: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
