import 'package:flutter/material.dart';

class ScientificCalculator extends StatelessWidget {
  const ScientificCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        Expanded(child: Container())
      ],
    );
  }
}
