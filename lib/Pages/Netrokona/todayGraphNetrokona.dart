import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Netrokona/netrokonaTodayDataModule.dart';
import 'package:toll_plaza/DesignModule/indicator.dart';
import 'package:toll_plaza/Pages/Netrokona/todayreportNetrokona.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'package:fl_chart/fl_chart.dart';

class TodayGraphNetrokona extends StatefulWidget {
  @override
  _TodayGraphNetrokonaState createState() => _TodayGraphNetrokonaState();
}

class _TodayGraphNetrokonaState extends State<TodayGraphNetrokona> {
  int touchedIndex;
  var colorList = [
    Color(0xffBC243C),
    Color(0xff0072B5),
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
    Color(0xff9B2335),
    Color(0xFFC3447A),
  ];

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<TodayReportNetrokonaDatabase>(context);
    final providerThemeAndData = Provider.of<ThemeAndColorProvider>(context);
    bool isDark = providerThemeAndData.darkTheme;

    return data.vehicleDataList.isEmpty ?
    Center(
      child: Text('Data not found',
        style: TextStyle(
          fontSize: 20,
          color: isDark ? Colors.white : Colors.black,
          //fontWeight: FontWeight.bold
        ),
      ),
    ) :
    Card(
      margin: EdgeInsets.all(0),
      color: providerThemeAndData.backgroundColor,
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
                        if (pieTouchResponse.touchInput is FlLongPressEnd || pieTouchResponse.touchInput is FlPanEnd) {
                          //touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 50,
                    sections: showingSections()
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: data.vehicleDataList.length,
              itemBuilder: (context, index) {
                return Indicator(
                  color: colorList[index],
                  text: data.vehicleDataList[index].vehicleName,
                  value: (int.parse(data.vehicleDataList[index].regular) - int.parse(data.vehicleDataList[index].ctrlR)).toString(),
                  //data.vehicleDataList[index].regular.toString(),
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
    var data = Provider.of<TodayReportNetrokonaDatabase>(context);

    return List.generate(data.vehicleDataList.length, (i) {
      var value = (double.parse(data.vehicleDataList[i].regular) - double.parse(data.vehicleDataList[i].ctrlR)) / (double.parse(data.regular) - double.parse(data.ctrlR )) * 100;
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 0;
      final double radius = isTouched ? 70 : 50;


      return PieChartSectionData(
        color: colorList[i],
        value: value,
        title: data.vehicleDataList[i].vehicleName+": \n"+value.toStringAsFixed(1) + ' %',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: context.watch<ThemeAndColorProvider>().secondTextColor),
      );
    });
  }
}
