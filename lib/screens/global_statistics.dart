import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../utils/constants.dart';

import '../models/global_summary.dart';

class GlobalStatistics extends StatelessWidget {
  late GlobalSummaryModel? summary;

  GlobalStatistics({required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard("Vaka Sayısı", summary!.totalConfirmed, summary!.newConfirmed,
            kConfirmedColor),
        buildCard(
            "Aktif",
            ((summary!.totalConfirmed -
                        summary!.totalDeaths -
                        summary!.totalRecovered) /
                    19)
                .toStringAsFixed(0),
            ((summary!.newConfirmed -
                        summary!.newRecovered -
                        summary!.newDeaths) /
                    19)
                .toStringAsFixed(0),
            kActiveColor),
        buildCard2(
            "1 Milyon Kişi Başına Vaka Sayısı",
            (((summary!.totalConfirmed)) / 7800).toStringAsFixed(0),
            kRecoveredColor),
        buildCard("Vefat Sayısı", summary!.totalDeaths, summary!.newDeaths,
            kDeathColor),
      ],
    );
  }

  Widget buildCard(String title, var totalCount, var todayCount, Color color) {
    return Card(
      elevation: 1,
      child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Toplam",
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        totalCount.toString().replaceAllMapped(
                            reg, (Match match) => '${match[1]}.'),
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Bugün",
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        todayCount.toString().replaceAllMapped(
                            reg, (Match match) => '${match[1]}.'),
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }

  Widget buildCard2(String title, var totalCount, Color color) {
    return Card(
      elevation: 1,
      child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        totalCount.toString().replaceAllMapped(
                            reg, (Match match) => '${match[1]}.'),
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
