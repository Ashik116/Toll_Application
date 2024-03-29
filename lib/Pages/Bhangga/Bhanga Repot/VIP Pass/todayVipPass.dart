import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Bhanga/todayVipPassReportBhangaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Dhaleshwari/todayVipPassReportDhaleshwariDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/todayVipPassReportMohanondaDataModule.dart';
import 'package:toll_plaza/DesignModule/vehicleReportViewingDesign.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class TodayVipPassBhanga extends StatefulWidget {
  @override
  _TodayVipPassBhangaState createState() => _TodayVipPassBhangaState();
}

class _TodayVipPassBhangaState extends State<TodayVipPassBhanga> {
  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    final vehicleDataList = Provider.of<TodayVipPassReportBhangaDataModule>(context);
    return Column(children: [
      SizedBox(
        height: 2,
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        color: providerThemeAndColor.barColor,
        child: Text(
          "Total VIP Pass: ${vehicleDataList.totalVehicle.toString()}",
          style: TextStyle(
              color: providerThemeAndColor.secondTextColor,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Expanded(
        child: ListView.builder(
            itemCount: vehicleDataList.vehicleReportList.length,
            itemBuilder: (context, index) {
              var vehicle = vehicleDataList.vehicleReportList[index];
              return VehicleReportViewingDesign(
                vehicleName: vehicle.vehicleName.toString(),
                vehicleImage: vehicle.vehicleImage.toString(),
                secondRowTitle: "Total Count",
                totalVehicle: vehicle.totalVehicle.toString(),
                perVehicleRate: vehicle.perVehicleRate.toString(),
                triadRowTitle: "Total Payment",
                totalPayment: '0',
              );
            }),
      ),
    ]);
  }
}
