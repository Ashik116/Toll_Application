import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/todayReportTeestaDataModule.dart';
import 'package:toll_plaza/DesignModule/indicator.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class TodayRevenueGraphTeesta extends StatefulWidget {
  @override
  _TodayRevenueGraphTeestaState createState() => _TodayRevenueGraphTeestaState();
}

class _TodayRevenueGraphTeestaState extends State<TodayRevenueGraphTeesta> {
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
    //Color(0xff66096B),
  ];

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<TodayReportTeestaDataModule>(context);
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
              itemCount: 13,
              itemBuilder: (context, index) {
                int perVehicleRevenue =
                    data.vehicleReportList[index].totalVehicle *
                        data.vehicleReportList[index].perVehicleRate;
                /*data.yesterdayVehicleReportList[index].totalVehicle *
                        data.yesterdayVehicleReportList[index].perVehicleRate;*/
                return Indicator(
                  color: colorList[index],
                  text: data.vehicleReportList[index].vehicleName,
                  //text: data.yesterdayVehicleReportList[index].vehicleName,
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
    return List.generate(13, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20 : 0;
      final double radius = isTouched ? 60 : 50;
      var data = Provider.of<TodayReportTeestaDataModule>(context);

      int perVehicleRevenue = data.vehicleReportList[i].totalVehicle *
          data.vehicleReportList[i].perVehicleRate;
      /*int perVehicleRevenue = data.yesterdayVehicleReportList[i].totalVehicle *
          data.yesterdayVehicleReportList[i].perVehicleRate;*/
      double value = (perVehicleRevenue / data.totalAmount) * 100;
      String title = data.vehicleReportList[i].vehicleName;
      /*double value = (perVehicleRevenue / data.totalYesterdayRevenue) * 100;
      String title = data.yesterdayVehicleReportList[i].vehicleName;*/
      return PieChartSectionData(
        color: colorList[i],
        value: value,
        title: title.toString() + ": \n" + value.toStringAsFixed(1) + ' %',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: context.watch<ThemeAndColorProvider>().thirdTextColor
        ),
      );
    });
  }
}
