import 'package:flutter/material.dart';

class HistoryData extends StatelessWidget {
  const HistoryData({Key? key,required this.historyScroll}) : super(key: key);

  final ScrollController historyScroll;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      controller: historyScroll,
      child: Column(
        children: [
          for (var i = 0; i < 20; i++) ...[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              color: Colors.red,
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
          ]
        ],
      ),
    );
  }
}
