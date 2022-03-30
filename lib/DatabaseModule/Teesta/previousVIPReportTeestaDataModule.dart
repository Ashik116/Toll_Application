import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PreviousVIPReportTeestaDataModule extends ChangeNotifier {
  var date;
  var vehicles;
  var weeklyDate;

  PreviousVIPReportTeestaDataModule({this.date, this.vehicles});

  List<PreviousVIPReportTeestaDataModule> _dataList = [];

  List<PreviousVIPReportTeestaDataModule> get dataList => _dataList;

  getReport() {
    try {
      DatabaseReference reference = FirebaseDatabase.instance.reference();
      reference.child("PreviousVip").onValue.listen((event) {
        var data = event.snapshot.value;
        dataList.clear();
        for (var i = 1; i <= 7; i++) {
          weeklyDate = DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(Duration(days: i)));
          if (data[weeklyDate] != null)
            dataList.add(PreviousVIPReportTeestaDataModule(
                date: weeklyDate,
                vehicles: data[weeklyDate]
            ));
        }
      });
    } catch (e) {

    }
    notifyListeners();
  }
}
