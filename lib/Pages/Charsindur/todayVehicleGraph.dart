import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayVipPassReportCharsindurDataModule.dart';
import 'package:toll_plaza/DesignModule/indicator.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class TodayVehicleGraph extends StatefulWidget {
  @override
  _TodayVehicleGraphState createState() => _TodayVehicleGraphState();
}

class _TodayVehicleGraphState extends State<TodayVehicleGraph> {
  int touchedIndex;
  var colorList = [
    Color(0xFFC3447A),
    Color(0xffBC243C),
    Color(0xff9B2335),
    Color(0xff5B5EA6),
    Color(0xffEFC050),
    Color(0xff45B8AC),
    Color(0xffD65076),
    Color(0xffDD4124),
    Color(0xff009B77),
    Color(0xffB565A7),
    Color(0xff955251),
    Color(0xff0072B5),
    Color(0xffFDAC53),
    Color(0xff0da000),
    //Color(0xff66096B),
  ];

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<TodayReportCharsindurDataModule1>(context);
    var dataVip = Provider.of<TodayVipPassCharsindurReportDataModule>(context);
    return Card(
      margin: EdgeInsets.all(0),
      color: context.watch<ThemeAndColorProvider>().backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: <Widget>[
            Container(
              height: 280,
              child: PieChart(
                PieChartData(
                    pieTouchData:
                        PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse.touchInput is FlLongPressEnd ||
                            pieTouchResponse.touchInput is FlPanEnd) {
                          // touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 70,
                    sections: showingSections()),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 14,
              itemBuilder: (context, index) {
                if (index == 13) {
                  return Indicator(
                    color: colorList[index],
                    text: "VIP PASS",
                    value: dataVip.totalYesterdayVehicle.toString(),
                    isSquare: true,
                  );
                } else {
                  return Indicator(
                    color: colorList[index],
                    text: data.yesterdayVehicleReportList[index].vehicleName,
                    value: data.yesterdayVehicleReportList[index].totalVehicle
                        .toString(),
                    isSquare: true,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(14, (i) {
      var data = Provider.of<TodayReportCharsindurDataModule1>(context);
      var dataVip =
          Provider.of<TodayVipPassCharsindurReportDataModule>(context);
      double value = 0.00;
      String title;
      if (i == 13) {
        title = "VIP Pass";
        value = (dataVip.totalYesterdayVehicle /
                (data.totalYesterdayVehicle + dataVip.totalYesterdayVehicle)) *
            100;
      } else {
        title = data.yesterdayVehicleReportList[i].vehicleName;
        value = (data.yesterdayVehicleReportList[i].totalVehicle /
                (data.totalYesterdayVehicle + dataVip.totalYesterdayVehicle)) *
            100;
      }
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20 : 0;
      final double radius = isTouched ? 60 : 50;

      return PieChartSectionData(
        color: colorList[i],
        value: value,
        title: title.toString() + ": \n" + value.toStringAsFixed(1) + ' %',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: context.watch<ThemeAndColorProvider>().secondTextColor),
      );
    });
  }
}
