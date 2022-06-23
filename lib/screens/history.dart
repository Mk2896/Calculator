import 'package:calculator/widgets/history/history_data.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
    required this.openHistoryMethod,
    required this.historyScroll,
  }) : super(key: key);

  final void Function()? openHistoryMethod;
  final ScrollController historyScroll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: HistoryData(
            historyScroll: historyScroll,
          ),
        ),
        InkWell(
          onTap: openHistoryMethod,
          child: Container(
            margin: const EdgeInsets.only(left: 40),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Icon(
              Icons.history,
              color: Theme.of(context).textTheme.titleSmall?.color,
            ),
          ),
        )
      ],
    );
  }
}
