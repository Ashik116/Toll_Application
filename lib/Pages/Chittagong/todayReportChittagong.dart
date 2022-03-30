import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/chittagongTodyDataModule.dart';
import 'package:toll_plaza/DesignModule/ChittagongEachRowDesign.dart';
import 'package:toll_plaza/DesignModule/ChittagongVehicleReportViewingDesign.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class TodayReportChittagong extends StatefulWidget {
  @override
  _TodayReportChittagongState createState() => _TodayReportChittagongState();
}

class _TodayReportChittagongState extends State<TodayReportChittagong> {
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    final todayData = Provider.of<TodayReportChittagongDatabase>(context);
    bool isDark = providerThemeAndColor.darkTheme;

    String overload = "null";
    if (todayData.vehicleDataList.isNotEmpty) {
      overload = (int.parse(todayData.regular) - int.parse(todayData.notOverload)).toString();
    }
    //
    return Column(children: [
      ChittagongEachRowDesign(
        firstColumnData: "Overloaded\n$overload",
        secondColumnData: "Not Overloaded\n${todayData.notOverload.toString()}",
        thirdColumnData: "Ctrl+R\n${todayData.ctrlR.toString()}",
        fourthColumnData: "Total\n${todayData.total.toString()}",
        backgroundColor: providerThemeAndColor.barColor,
        firstColumnFontColor: providerThemeAndColor.secondTextColor,
        secondColumnFontColor: providerThemeAndColor.secondTextColor,
        thirdColumnFontColor: providerThemeAndColor.secondTextColor,
        fourthColumnFontColor: providerThemeAndColor.secondTextColor, //test
        fontWeight: FontWeight.bold,
      ),
      SizedBox(
        height: 5,
      ),
      Expanded(
          child: todayData.vehicleDataList.isNotEmpty
              ? ListView.builder(
              itemCount: todayData.vehicleDataList.length,
              itemBuilder: (context, index) {
                var vehicle = todayData.vehicleDataList[index];
                return ChittagongVehicleReportViewingDesign(
                  vehicleName: vehicle.vehicleName.toString(),
                  vehicleImage: vehicle.image.toString(),
                  secondRowTitle: "Overload",
                  regular: (int.parse(vehicle.regular) - int.parse(vehicle.notOverload) - int.parse(vehicle.ctrlR)).toString(),
                  triadRowTitle: "Not Overloaded",
                  ctrlR: vehicle.notOverload,
                  fourthRowTitle: "Ctrl+R",
                  fourthRowData: vehicle.ctrlR,
                );
              }) :
          Center(
            child: Text(
              "Data not found",
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
            ),
          )
      ),
    ]
    );
  }
}