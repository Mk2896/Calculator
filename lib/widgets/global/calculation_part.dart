import 'package:calculator/models/calculations.dart';
import 'package:calculator/widgets/global/custom_text_field.dart';
import 'package:flutter/material.dart';

class CalculationPart extends StatefulWidget {
  const CalculationPart({Key? key}) : super(key: key);

  @override
  State<CalculationPart> createState() => _CalculationPartState();
}

class _CalculationPartState extends State<CalculationPart>
    with WidgetsBindingObserver {
  // Variables for TextField FontSize and Controller
  double _fontSizeField = 50;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    didChangeMetrics();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

// method that run every time orientation changes
  @override
  void didChangeMetrics() {
    final currentOrientation =
        WidgetsBinding.instance.window.physicalSize.aspectRatio > 1
            ? Orientation.landscape
            : Orientation.portrait;
    if (currentOrientation == Orientation.landscape) {
      _fontSizeField = 35;
    } else {
      _fontSizeField = 50;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextField(
            textController: Calculation.calculationController,
            scrollController: Calculation.calculationScroll,
            bottomMargin: 5,
            fontSize: _fontSizeField,
          ),
          CustomTextField(
            textController: Calculation.resultController,
            fontSize: 25,
          ),
        ],
      ),
    );
  }
}
