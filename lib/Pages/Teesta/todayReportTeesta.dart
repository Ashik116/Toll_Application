import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/todayReportTeestaDataModule.dart';
import 'package:toll_plaza/DesignModule/vehicleReportViewingDesign.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class TodayReportTeesta extends StatefulWidget {
  @override
  _TodayReportTeestaState createState() => _TodayReportTeestaState();
}

class _TodayReportTeestaState extends State<TodayReportTeesta> {
  Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _onRefresh());
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    final vehicleDataList = Provider.of<TodayReportTeestaDataModule>(context);
    return Scaffold(
        backgroundColor: providerThemeAndColor.backgroundColor,
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: Column(children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: providerThemeAndColor.barColor,
              child: Text(
                'Running Fund: ${vehicleDataList.totalAmount.toString()} tk',
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
                      totalPayment:
                          (vehicle.totalVehicle * vehicle.perVehicleRate)
                              .toString(),
                    );
                  }),
            ),
          ]),
        ));
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    int time = int.parse(DateFormat.H().format(DateTime.now()).toString());

    if (time < 7) {
      //------- data get to api 12 am to 7 am ------------
      await context
          .read<TodayReportTeestaDataModule>()
          .getTodayReportData("http://103.182.219.34/api/api/yesterday.php");
    } else {
      //------- data get to api 7 am to 12 am ------------
      await context
          .read<TodayReportTeestaDataModule>()
          .getTodayReportData("http://103.182.219.34/api/api/today.php");
    }
    setState(() {});
  }
}
