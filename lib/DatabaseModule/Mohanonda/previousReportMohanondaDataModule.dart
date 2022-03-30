import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PreviousReportMohanondaDataModule extends ChangeNotifier {
  var date;
  var dailyTotalAmount;
  var vehicles;

  PreviousReportMohanondaDataModule({
    this.date,
    this.vehicles,
    this.dailyTotalAmount
  });

  List<PreviousReportMohanondaDataModule> _dataList = [];

  List<PreviousReportMohanondaDataModule> get dataList => _dataList;

  getReport() {
    try {
      DatabaseReference reference = FirebaseDatabase.instance.reference();

      reference.child("Mohanonda").onValue.listen((event) {
        var data = event.snapshot.value;
        dataList.clear();

        for (var i = 1; i <= 7; i++) {
          var weeklyDate = DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(Duration(days: i)));

          if (data[weeklyDate] != null) {
            dataList.add(PreviousReportMohanondaDataModule.fromJson(data[weeklyDate]));
          }
        }
      });
    } catch (e) {

    }
    notifyListeners();
  }

  PreviousReportMohanondaDataModule.fromJson(Map<dynamic, dynamic> json) {
    date = json['date'];
    dailyTotalAmount = json['dayTotalAmount'];
    vehicles = json['vichelAmount'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['date'] = this.date;
    data['dayTotalAmount'] = this.dailyTotalAmount;
    data['vichelAmount'] = this.vehicles;
    return data;
  }
}
