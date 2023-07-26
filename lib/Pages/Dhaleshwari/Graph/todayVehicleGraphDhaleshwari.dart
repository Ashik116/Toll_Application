import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Dhaleshwari/todayReportDhaleshwariDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Dhaleshwari/todayVipPassReportDhaleshwariDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/todayReportMohanondaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/todayVipPassReportMohanondaDataModule.dart';
import 'package:toll_plaza/DesignModule/indicator.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class TodayVehicleGraphDhaleshwari extends StatefulWidget {
  @override
  _TodayVehicleGraphDhaleshwariState createState() => _TodayVehicleGraphDhaleshwariState();
}

class _TodayVehicleGraphDhaleshwariState
    extends State<TodayVehicleGraphDhaleshwari> {
  int touchedIndex;
  var colorList = [
    Color(0xff063be8),
    Color(0xff498f03),
    Color(0xff9B2335),
    Color(0xff5B5EA6),
    Color(0xffEFC050),
    Color(0xff45B8AC),
    Color(0xffD65076),
    Color(0xffDD4124),
    Color(0xff009B77),
    Color(0xfff30000),
    Color(0xff955251),

  ];

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<TodayReportDhaleshwariDataModule>(context);
    var dataVip = Provider.of<TodayVipPassReportDhaleshwariDataModule>(context);
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
                    pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
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
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 9) {
                  return Indicator(
                    color: colorList[index],
                    text: "VIP PASS",
                    value: dataVip.totalVehicle.toString(),
                    isSquare: true,
                  );
                } else {
                  return Indicator(
                    color: colorList[index],
                    text: data.vehicleReportList[index].vehicleName,
                    value: data.vehicleReportList[index].totalVehicle
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
    return List.generate(10, (i) {
      var data = Provider.of<TodayReportDhaleshwariDataModule>(context);
      var dataVip = Provider.of<TodayVipPassReportDhaleshwariDataModule>(context);
      double value = 0.00;
      String title;
      if (i == 9) {
        title = "VIP Pass";
        value = (dataVip.totalVehicle / (data.totalVehicle + dataVip.totalVehicle)) * 100;
      } else {
        title = data.vehicleReportList[i].vehicleName;
        value = (data.vehicleReportList[i].totalVehicle / (data.totalVehicle + dataVip.totalVehicle)) * 100;
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
            color: context.watch<ThemeAndColorProvider>().secondTextColor
        ),
      );
    });
  }
}
