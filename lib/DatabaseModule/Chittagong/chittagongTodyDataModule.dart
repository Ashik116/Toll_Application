import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/winVehicleReportModule.dart';

class TodayReportChittagongDatabase extends ChangeNotifier {
  var axel2;
  var axel3;
  var axel4;
  var axel5;
  var axel6;
  var axel7;

  var axel2ld;
  var axel3ld;
  var axel4ld;
  var axel5ld;
  var axel6ld;
  var axel7ld;

  var notOverload;
  var regular;
  var ctrlR;
  var total;

  List<TodayReportChittagongDatabase> dataList = [];
  List<WinVehicleReportModule> vehicleDataList = [];

  TodayReportChittagongDatabase({
    this.axel2,
    this.axel3,
    this.axel4,
    this.axel5,
    this.axel6,
    this.axel7
  });

  getShortReport() {
    DatabaseReference reference = FirebaseDatabase.instance.reference();
    var today = DateFormat("dd-MM-yyyy").format(DateTime.now());
    reference.child("chittagong2").child(today).onValue.listen((event) async {
      var data = event.snapshot.value;
      if (data != null) {
        if (data['short'] != null) {
          var todayShortReport = ShortReportModel.fromJson(data['short']);
          regular = todayShortReport.regular;
          total = todayShortReport.total;
          ctrlR = todayShortReport.ctrlR;
          notOverload = todayShortReport.notOverload;
        }
      }
    });
    notifyListeners();
  }

  getReport() {
    DatabaseReference reference = FirebaseDatabase.instance.reference();
    var today = DateFormat("dd-MM-yyyy").format(DateTime.now());

    reference.child("chittagong2").child(today).onValue.listen((event) async {
      var data = event.snapshot.value;

      if (data != null) {
        dataList.clear();
        dataList.add(TodayReportChittagongDatabase(
            axel2: 0, axel3: 0, axel4: 0, axel5: 0, axel6: 0, axel7: 0
        ));

        if (data['ctrlReport'] != null) {
          var todayCtrlReport = CtrlReportModel.fromJson(data['ctrlReport']);

          dataList[0].axel2 = int.parse(todayCtrlReport.ctrl2);
          dataList[0].axel3 = int.parse(todayCtrlReport.ctrl3);
          dataList[0].axel4 = int.parse(todayCtrlReport.ctrl4);
          dataList[0].axel5 = int.parse(todayCtrlReport.ctrl5);
          dataList[0].axel6 = int.parse(todayCtrlReport.ctrl6);
          dataList[0].axel7 = int.parse(todayCtrlReport.ctrl7);
        }
        vehicleDataList.clear();

        var vehicleData = TodayReportChittagongDatabase.fromJson(data["RegularReport"]);
        var notOverloadData = TodayReportChittagongDatabase.fromJson2(data["notOverload"]);

        vehicleDataList.add(WinVehicleReportModule(
            vehicleName: "Axle 2",
            regular: vehicleData.axel2,
            notOverload: notOverloadData.axel2ld,
            ctrlR: dataList[0].axel2.toString(),
            image: "assets/images/mini_truck.png"
        ));
        vehicleDataList.add(WinVehicleReportModule(
            vehicleName: "Axle 3",
            regular: vehicleData.axel3,
            notOverload: notOverloadData.axel3ld,
            ctrlR: dataList[0].axel3.toString(),
            image: "assets/images/axel3.jpg"
        ));
        vehicleDataList.add(WinVehicleReportModule(
            vehicleName: "Axle 4",
            regular: vehicleData.axel4,
            notOverload: notOverloadData.axel4ld,
            ctrlR: dataList[0].axel4.toString(),
            image: "assets/images/heavy_truck.png"
        ));
        vehicleDataList.add(WinVehicleReportModule(
            vehicleName: "Axle 5",
            regular: vehicleData.axel5,
            notOverload: notOverloadData.axel5ld,
            ctrlR: dataList[0].axel5.toString(),
            image: "assets/images/axel5.jpg"
        ));
        vehicleDataList.add(WinVehicleReportModule(
            vehicleName: "Axle 6",
            regular: vehicleData.axel6,
            notOverload: notOverloadData.axel6ld,
            ctrlR: dataList[0].axel6.toString(),
            image: "assets/images/trailer_long.png"
        ));
        vehicleDataList.add(WinVehicleReportModule(
            vehicleName: "Axle 7",
            regular: vehicleData.axel7,
            notOverload: notOverloadData.axel7ld,
            ctrlR: dataList[0].axel7.toString(),
            image: "assets/images/trailer_long.png"
        ));
      }
    });
    notifyListeners();
  }

  TodayReportChittagongDatabase.fromJson(Map<dynamic, dynamic> json) {
    axel2 = json['axel2'];
    axel3 = json['axel3'];
    axel4 = json['axel4'];
    axel5 = json['axel5'];
    axel6 = json['axel6'];
    axel7 = json['axel7'];
  }
  TodayReportChittagongDatabase.fromJson2(Map<dynamic, dynamic> json2) {
    axel2ld = json2['ld_axel2'];
    axel3ld = json2['ld_axel3'];
    axel4ld = json2['ld_axel4'];
    axel5ld = json2['ld_axel5'];
    axel6ld = json2['ld_axel6'];
    axel7ld = json2['ld_axel7'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['axel2'] = this.axel2;
    data['axel3'] = this.axel3;
    data['axel4'] = this.axel4;
    data['axel5'] = this.axel5;
    data['axel6'] = this.axel6;
    data['axel7'] = this.axel7;
    return data;
  }
}