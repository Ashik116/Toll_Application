import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayVipPassReportCharsindurDataModule.dart';
import 'package:toll_plaza/DesignModule/vehicleReportViewingDesign.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class TodayVipPassCharsindur extends StatefulWidget {
  @override
  _TodayVipPassCharsindurState createState() => _TodayVipPassCharsindurState();
}

class _TodayVipPassCharsindurState extends State<TodayVipPassCharsindur> {
  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    final vehicleDataList =
        Provider.of<TodayVipPassCharsindurReportDataModule>(context);
    return Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
        ),
        child: Text(
          "Total VIP Pass: ${vehicleDataList.totalVehicle.toString()}",
          style: TextStyle(
            color: Colors.red.shade900,
              //color: providerThemeAndColor.secondTextColor,
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
