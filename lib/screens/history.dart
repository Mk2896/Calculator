import 'package:calculator/widgets/global/custom_text.dart';
import 'package:calculator/widgets/history/history_data.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
    required this.openHistoryMethod,
    required this.onScrollMethod,
    required this.refreshController,
    required this.clearHistory,
  }) : super(key: key);

  final void Function()? openHistoryMethod;
  final void Function()? onScrollMethod;
  final void Function()? clearHistory;
  final RefreshController refreshController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom +
                  kBottomNavigationBarHeight +
                  10),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: ListTile(
                leading: IconButton(
                  onPressed: onScrollMethod,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                title: CustomText(
                  text: "History",
                  fontSize: 20,
                  textColor: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.w600,
                ),
                trailing: InkWell(
                  onTap: clearHistory,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.clear_all,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      Text(
                        "Clear History",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: HistoryData(
                onRefreshMethod: onScrollMethod,
                refreshController: refreshController,
              ),
            ),
          ]),
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
