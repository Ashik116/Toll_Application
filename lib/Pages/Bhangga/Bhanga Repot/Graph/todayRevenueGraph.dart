import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Bhanga/todayReportBhangaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Dhaleshwari/todayReportDhaleshwariDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/todayReportMohanondaDataModule.dart';
import 'package:toll_plaza/DesignModule/indicator.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class TodayRevenueGraphBhanga extends StatefulWidget {
  @override
  _TodayRevenueGraphBhangaState createState() =>
      _TodayRevenueGraphBhangaState();
}

class _TodayRevenueGraphBhangaState
    extends State<TodayRevenueGraphBhanga> {
  int touchedIndex;
  var colorList = [
    Color(0xFF072DE5),
    Color(0xffBC243C),
    Color(0xff9B2335),
    Color(0xff5B5EA6),
    Color(0xffEFC050),
    Color(0xff45B8AC),
    Color(0xff490303),
    Color(0xffDD4124),
    Color(0xff009B77),
    Color(0xffB565A7),

  ];

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<TodayReportBhangaDataModule>(context);
    var themeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Card(
      margin: EdgeInsets.all(0),
      color: themeAndColor.backgroundColor,
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
                int perVehicleRevenue = data.vehicleReportList[index].totalVehicle * data.vehicleReportList[index].perVehicleRate;
                return Indicator(
                  color: colorList[index],
                  text: data.vehicleReportList[index].vehicleName,
                  value: perVehicleRevenue.toString() + " Tk",
                  isSquare: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(10, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 0;
      final double radius = isTouched ? 60 : 50;
      var data = Provider.of<TodayReportBhangaDataModule>(context);

      int perVehicleRevenue = data.vehicleReportList[i].totalVehicle *
          data.vehicleReportList[i].perVehicleRate;
      double value = (perVehicleRevenue / data.totalRevenue) * 100;
      String title = data.vehicleReportList[i].vehicleName;
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
