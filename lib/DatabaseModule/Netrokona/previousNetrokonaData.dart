import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toll_plaza/DatabaseModule/Netrokona/winVehicleReportModule.dart';

class PreviousReportNetrokonaDatabase extends ChangeNotifier {
  List<ShortReportModel> previousDataListNetrokona = [];

  void getPreviousReport() {
    try {
      previousDataListNetrokona.clear();
      DatabaseReference reference = FirebaseDatabase.instance.reference();
      reference.child("netrokona").onValue.listen((event) async  {
        var data = event.snapshot.value;
        previousDataListNetrokona.clear();

        for(var i = 1; i <= 7; i++){
          var weeklyDate = DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(Duration(days: i)));

          if(data[weeklyDate] != null){
            var dailyData = ShortReportModel.fromJson(data[weeklyDate]['short']);
            previousDataListNetrokona.add(ShortReportModel(
                total: dailyData.total,
                regular: dailyData.regular,
                ctrlR: dailyData.ctrlR,
                date: weeklyDate
            ));
          }
        }
      });
    } catch (e) {

    }
    notifyListeners();
  }
}