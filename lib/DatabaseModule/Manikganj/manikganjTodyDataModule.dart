import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/winVehicleReportModule.dart';

class TodayReportManikganjDatabase with ChangeNotifier {
  var axel2;
  var axel3;
  var axel4;
  var axel5;
  var axel6;
  var axel7;

  var regular;
  var ctrlR;
  var total;

  List<TodayReportManikganjDatabase> dataList = [];
  List<WinVehicleReportModule> vehicleDataList = [];

  TodayReportManikganjDatabase({
    this.axel2,
    this.axel3,
    this.axel4,
    this.axel5,
    this.axel6,
    this.axel7
  });

  void getShortReport() {
    try{
      DatabaseReference reference = FirebaseDatabase.instance.reference();
      var today = DateFormat("dd-MM-yyyy").format(DateTime.now());

      reference.child("manikganj").child(today).onValue.listen((event) async {
        var data = event.snapshot.value;

        if (data != null) {
          if (data['short'] != null) {
            var todayShortReport = ShortReportModel.fromJson(data['short']);
            regular = todayShortReport.regular;
            total = todayShortReport.total;
            ctrlR = todayShortReport.ctrlR;
          }
        }
      });
    } catch(e) {

    }
    notifyListeners();
  }

  void getReport() {
    try{
      DatabaseReference reference = FirebaseDatabase.instance.reference();
      var today = DateFormat("dd-MM-yyyy").format(DateTime.now());

      reference.child("manikganj").child(today).onValue.listen((event) async {
        var data = event.snapshot.value;

        if (data != null) {
          dataList.clear();
          dataList.add(TodayReportManikganjDatabase(
              axel2: 0,
              axel3: 0,
              axel4: 0,
              axel5: 0,
              axel6: 0,
              axel7: 0
          ));

          if(data['ctrlReport'] != null) {
            for (var v in data['ctrlReport']) {
              if (v['e'] == 'Truck 2 Axle') {
                dataList[0].axel2 = dataList[0].axel2 + 1;
              } else if (v['e'] == "Truck 3 Axle") {
                dataList[0].axel3 = dataList[0].axel3 + 1;
              } else if (v['e'] == "Truck 4 Axle") {
                dataList[0].axel4 = dataList[0].axel4 + 1;
              } else if (v['e'] == "Truck 5 Axle") {
                dataList[0].axel5 = dataList[0].axel5 + 1;
              } else if (v['e'] == "Truck 6 Axle") {
                dataList[0].axel6 = dataList[0].axel6 + 1;
              } else if (v['e'] == "Truck 7 Axle") {
                dataList[0].axel7 = dataList[0].axel7 + 1;
              }
            }
          }
          vehicleDataList.clear();

          var vehicleData = TodayReportManikganjDatabase.fromJson(data["RegularReport"]);
          vehicleDataList.add(WinVehicleReportModule(
              vehicleName: "Axle 2",
              regular: vehicleData.axel2,
              ctrlR: dataList[0].axel2.toString(),
              image: "assets/images/mini_truck.png"
          ));

          vehicleDataList.add(WinVehicleReportModule(
              vehicleName: "Axle 3",
              regular: vehicleData.axel3,
              ctrlR: dataList[0].axel3.toString(),
              image: "assets/images/axel3.jpg"
          ));

          vehicleDataList.add(WinVehicleReportModule(
              vehicleName: "Axle 4",
              regular: vehicleData.axel4,
              ctrlR: dataList[0].axel4.toString(),
              image: "assets/images/heavy_truck.png"
          ));

          vehicleDataList.add(WinVehicleReportModule(
              vehicleName: "Axle 5",
              regular: vehicleData.axel5,
              ctrlR: dataList[0].axel5.toString(),
              image: "assets/images/axel5.jpg"
          ));

          vehicleDataList.add(WinVehicleReportModule(
              vehicleName: "Axle 6",
              regular: vehicleData.axel6,
              ctrlR: dataList[0].axel6.toString(),
              image: "assets/images/trailer_long.png"
          ));

          vehicleDataList.add(WinVehicleReportModule(
              vehicleName: "Axle 7",
              regular: vehicleData.axel7,
              ctrlR: dataList[0].axel7.toString(),
              image: "assets/images/trailer_long.png"
          ));
        }
      });
    }catch(e){

    }
    notifyListeners();
  }

  TodayReportManikganjDatabase.fromJson(Map<dynamic, dynamic> json) {
    axel2 = json['axel2'];
    axel3 = json['axel3'];
    axel4 = json['axel4'];
    axel5 = json['axel5'];
    axel6 = json['axel6'];
    axel7 = json['axel7'];
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