import 'package:math_expressions/math_expressions.dart';

import 'package:flutter/material.dart';
import 'package:calculator/widgets/global/extensions.dart';

class Calculation {
  static Map myHistory = {};

  static List<String> _lastOperand = [];
  static final TextEditingController resultController = TextEditingController();
  static final TextEditingController calculationController =
      TextEditingController();
  static final ScrollController calculationScroll = ScrollController();

  static final List<String> _firstRestrictedKeys = [
    "0",
    "%",
    "×",
    "÷",
    "+",
    "^2",
    "^",
    "!",
    ")",
  ];
  static final Map<String, List<String>> _cantRepeatConsecutivelyKeys = {
    "×": ["×", "÷", "+", "-", "%", "!", "^", "^2", ")"],
    "÷": ["×", "÷", "+", "-", "%", "!", "^", "^2", ")"],
    "+": ["×", "÷", "+", "-", "%", "!", "^", "^2", ")"],
    "-": ["×", "÷", "+", "-", "%", "!", "^", "^2", ")"],
    "%": [
      "!",
      "^",
      "^2",
      "%",
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "10^",
      "(",
      "π",
      "^",
      "!",
      "^2",
      "√",
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "."
    ],
    "arcsin(": ["+", "×", "÷", ")", "%", "(", "^", "!", "^2"],
    "sin(": ["+", "×", "÷", ")", "%", "(", "^", "!", "^2"],
    "arccos(": ["+", "×", "÷", ")", "%", "(", "^", "!", "^2"],
    "cos(": ["+", "×", "÷", ")", "%", "(", "^", "!", "^2"],
    "arctan(": ["+", "×", "÷", ")", "%", "(", "^", "!", "^2"],
    "tan(": ["+", "×", "÷", ")", "%", "(", "^", "!", "^2"],
    "ln(": ["+", "×", "÷", ")", "%", "(", "^", "!", "^2"],
    "10^": [
      "×",
      "÷",
      "+",
      "-",
      "!",
      "^",
      "^2",
      "%",
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "10^",
      ")",
      "π",
      "√",
      ".",
    ],
    "(": [")", "×", "÷", "+", "%", "^", "!", "^2"],
    ")": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      ".",
      "10^",
      "√"
    ],
    "π": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      ".",
      "10^",
      "√"
    ],
    "^": [
      "×",
      "÷",
      "+",
      "-",
      "%",
      "!",
      "^",
      "^2",
      ")",
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      ".",
      "10^",
      "√"
    ],
    "!": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "!",
      "10^",
      "(",
      "π",
      "^",
      "^2",
      "√",
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "."
    ],
    "^2": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "!",
      "10^",
      "(",
      "π",
      "^",
      "^2",
      "√",
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "."
    ],
    "√": ["!", "^", "^2", ")", "×", "÷", "+", "-", "%"],
    "0": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√"
    ],
    "1": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√"
    ],
    "2": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√"
    ],
    "3": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√"
    ],
    "4": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√"
    ],
    "5": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√"
    ],
    "6": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√"
    ],
    "7": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√"
    ],
    "8": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√"
    ],
    "9": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√"
    ],
    ".": [
      "arcsin(",
      "sin(",
      "arccos(",
      "cos(",
      "arctan(",
      "tan(",
      "ln(",
      "π",
      "10^",
      "(",
      "√",
      "×",
      "÷",
      "+",
      "-",
      "%",
      ")",
      "!",
      "^",
      "^2"
    ],
  };

  static final List<String> _allOperands = [
    "%",
    "÷",
    "+",
    "-",
    "×",
    "^",
    "arcsin(",
    "arccos(",
    "arctan(",
    "sin(",
    "cos(",
    "tan(",
    "ln("
        "!",
    "√",
  ];

  static final List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static void clearClick() {
    calculationController.text = "";
    resultController.text = "";
  }

  // static void backspaceClick() {
  //   var start = calculationController.selection.start;
  //   var end = calculationController.selection.end;
  //   var length = calculationController.text.length;
  //   if ((start != 0 || end != 0) && length > 0) {
  //     if (start == -1) {
  //       calculationController.text =
  //           calculationController.text.substring(0, length - 1);
  //     } else if (start == end) {
  //       if (length - 1 != 0) {
  //         calculationController.text =
  //             calculationController.text.substring(0, start - 1) +
  //                 calculationController.text.substring(end, length);
  //         calculationController.selection =
  //             TextSelection(baseOffset: end - 1, extentOffset: end - 1);
  //       } else {
  //         calculationController.text =
  //             calculationController.text.substring(0, start - 1);
  //       }
  //     } else {
  //       calculationController.text =
  //           calculationController.text.substring(0, start) +
  //               calculationController.text.substring(end, length);
  //       calculationController.selection =
  //           TextSelection(baseOffset: start, extentOffset: start);
  //     }

  //     String? result = _evaluateExpression();
  //     if (result != null) {
  //       resultController.text = result;
  //     } else {
  //       resultController.text = "";
  //     }
  //   }
  // }

  static void backspaceClick() {
    var length = calculationController.text.length;
    if (length != 0) {
      calculationController.text = calculationController.text
          .substring(0, length - _lastOperand.last.length);
      _lastOperand.removeLast();

      String? result = _evaluateExpression();
      if (result != null) {
        resultController.text = result;
      } else {
        resultController.text = "";
      }
    }
  }

  static void operandClick(text) {
    // var start = calculationController.selection.start;
    // var end = calculationController.selection.end;
    // var length = calculationController.text.length;

    if (_firstRestrictedKeys.contains(text) &&
        calculationController.text == "") {
      return;
    }

    if (text == "." && calculationController.text.contains(".")) {
      for (var i = _lastOperand.length - 1; i >= 0; i--) {
        if ([".", "0."].contains(_lastOperand[i])) {
          return;
        }

        if (["×", "÷", "+", "-", "^"].contains(_lastOperand[i])) {
          break;
        }
      }
    }

    if (text == "." &&
        (calculationController.text.isEmpty ||
            calculationController.selection.start == 0)) {
      text = "0.";
    }
    // if (_cantRepeatConsecutivelyKeys.contains(text) && length > 0) {
    //   if (start == -1) {
    //     if (_cantRepeatConsecutivelyKeys.contains(
    //         calculationController.text.substring(length - 1, length))) {
    //       return;
    //     }
    //   } else {
    //     if (_cantRepeatConsecutivelyKeys
    //         .contains(calculationController.text.substring(start - 1, start))) {
    //       return;
    //     }
    //   }
    // }

    if (_lastOperand.isNotEmpty) {
      if (_cantRepeatConsecutivelyKeys.keys.contains(_lastOperand.last)) {
        if (_cantRepeatConsecutivelyKeys[_lastOperand.last]!.contains(text)) {
          return;
        }
      }
    }

    // if ((start == -1 && end == -1) || (start == end && start == length)) {
    _lastOperand.add(text);
    calculationController.text += text;
    _scrollToOffset(calculationScroll.position.maxScrollExtent + 50);
    // } else {
    //   calculationController.text =
    //       calculationController.text.substring(0, start) +
    //           text +
    //           calculationController.text.substring(end, length);
    //   calculationController.selection =
    //       TextSelection(baseOffset: start + 1, extentOffset: start + 1);
    //   _scrollToOffset(calculationScroll.offset + 20);
    // }

    String? result = _evaluateExpression();
    if (result != null) {
      resultController.text = result;
    } else {
      resultController.text = "";
    }
  }

  static _scrollToOffset(double offset) {
    calculationScroll.animateTo(
      offset,
      duration: const Duration(microseconds: 10),
      curve: Curves.easeIn,
    );
  }

  static String? _evaluateExpression() {
    try {
      Parser parser = Parser();
      String rawExp = calculationController.text;
      rawExp = rawExp.replaceAll("%", "/100");
      rawExp = rawExp.replaceAll("÷", "/");
      rawExp = rawExp.replaceAll("×", "*");
      rawExp = rawExp.replaceAll("√", "sqrt");
      rawExp = rawExp.replaceAll("π", "3.141592653589793");
      Expression exp = parser.parse(rawExp);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toPrecision(12).toString().removeLeadingZeroAfterDecimal();
    } catch (e) {
      return null;
    }
  }

  static void calculateClick() {
    if (_allOperands
        .any((element) => calculationController.text.contains(element))) {
      String? result = _evaluateExpression();
      resultController.text = "";
      if (result != null) {
        String expression = calculationController.text;
        calculationController.text = result;
        var now = DateTime.now();
        var currentExpression = {
          "expression": expression,
          "result": result,
        };
        String date = "${_months[now.month - 1]} ${now.day}, ${now.year}";
        if (myHistory.containsKey(date)) {
          myHistory[date].add(currentExpression);
        } else {
          myHistory[date] = [currentExpression];
        }
      }
    }
  }

  static void clearHistory() {
    myHistory = {};
  }
}
