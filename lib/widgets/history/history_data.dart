import 'package:calculator/models/calculations.dart';
import 'package:calculator/widgets/global/custom_text.dart';
import 'package:calculator/widgets/global/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryData extends StatelessWidget {
  HistoryData({
    Key? key,
    required this.onRefreshMethod,
    required this.refreshController,
  }) : super(key: key);

  final void Function()? onRefreshMethod;
  final RefreshController refreshController;

  late List<Widget> historyWidget = [];
  List<Widget> _getHistoryWidgets(context) {
    historyWidget = [];
    Calculation.myHistory.forEach((key, value) {
      historyWidget.add(CustomText(
        text: key,
        alignment: Alignment.topLeft,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        textColor: Theme.of(context).textTheme.titleMedium?.color,
      ));
      value.forEach((element) {
        historyWidget.add(CustomTextField(
          textController: null,
          fontSize: 25,
          initialValue: element['expression'],
          bottomMargin: 5,
          isReadonly: true,
        ));
        historyWidget.add(CustomText(
          text: element['result'],
          alignment: Alignment.topRight,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          textColor: Theme.of(context).textTheme.titleMedium?.color,
          bottomMargin: 15,
        ));
      });
    });
    return historyWidget;
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      reverse: true,
      onRefresh: onRefreshMethod,
      controller: refreshController,
      header: CustomHeader(
        builder: (context, mode) {
          return Container();
        },
      ),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: _getHistoryWidgets(context),
        ),
      ),
    );
  }
}
