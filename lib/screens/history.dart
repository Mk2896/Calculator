import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key, required this.openHistoryMethod}) : super(key: key);

  final void Function()? openHistoryMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.green,
        ),
        InkWell(
          onTap: openHistoryMethod,
          child: Container(
            margin: const EdgeInsets.only(right: 40),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Icon(
              Icons.history,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        )
      ],
    );
  }
}
