import 'package:calculator/models/calculations.dart';
import 'package:calculator/widgets/calculator/button_column.dart';
import 'package:flutter/material.dart';

class ScientificCalculator extends StatelessWidget {
  const ScientificCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        child: Row(
          children: [
            ButtonColumn(
              button1Text: "arcsin",
              button2Text: "arccos",
              button3Text: "arctan",
              button4Text: "10^x",
              button5Text: "(",
              isScientific: true,
              button1Method: () => Calculation.operandClick("arcsin("),
              button2Method: () => Calculation.operandClick("arccos("),
              button3Method: () => Calculation.operandClick("arctan("),
              button4Method: () => Calculation.operandClick("10^"),
              button5Method: () => Calculation.operandClick("("),
            ),
            ButtonColumn(
              button1Text: "sin",
              button2Text: "cos",
              button3Text: "tan",
              button4Text: "ln",
              button5Text: ")",
              isScientific: true,
              button1Method: () => Calculation.operandClick("sin("),
              button2Method: () => Calculation.operandClick("cos("),
              button3Method: () => Calculation.operandClick("tan("),
              button4Method: () => Calculation.operandClick("ln("),
              button5Method: () => Calculation.operandClick(")"),
            ),
            ButtonColumn(
              button1Text: "π",
              button2Text: "x^y",
              button3Text: "x!",
              button4Text: "x²",
              button5Text: "√",
              isScientific: true,
              button1Method: () => Calculation.operandClick("π"),
              button2Method: () => Calculation.operandClick("^"),
              button3Method: () => Calculation.operandClick("!"),
              button4Method: () => Calculation.operandClick("^2"),
              button5Method: () => Calculation.operandClick("√"),
            ),
            ButtonColumn(
              button1Text: "C",
              button1SpecialColor: true,
              button2Text: "7",
              button3Text: "4",
              button4Text: "1",
              button5Text: "%",
              isScientific: true,
              button1Method: Calculation.clearClick,
              button2Method: () => Calculation.operandClick("7"),
              button3Method: () => Calculation.operandClick("4"),
              button4Method: () => Calculation.operandClick("1"),
              button5Method: () => Calculation.operandClick("%"),
            ),
            ButtonColumn(
              button1Text: "÷",
              button1SpecialColor: true,
              button2Text: "8",
              button3Text: "5",
              button4Text: "2",
              button5Text: "0",
              isScientific: true,
              button1Method: () => Calculation.operandClick("÷"),
              button2Method: () => Calculation.operandClick("8"),
              button3Method: () => Calculation.operandClick("5"),
              button4Method: () => Calculation.operandClick("2"),
              button5Method: () => Calculation.operandClick("0"),
            ),
            ButtonColumn(
              button1Text: "×",
              button1SpecialColor: true,
              button2Text: "9",
              button3Text: "6",
              button4Text: "3",
              button5Text: ".",
              isScientific: true,
              button1Method: () => Calculation.operandClick("×"),
              button2Method: () => Calculation.operandClick("9"),
              button3Method: () => Calculation.operandClick("6"),
              button4Method: () => Calculation.operandClick("3"),
              button5Method: () => Calculation.operandClick("."),
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
              isScientific: true,
              button1Method: Calculation.backspaceClick,
              onBtnLongPress: Calculation.clearClick,
              button2Method: () => Calculation.operandClick("-"),
              button3Method: () => Calculation.operandClick("+"),
              button4Method: () => Calculation.calculateClick(),
            ),
          ],
        ),
      ),
    );
  }
}
