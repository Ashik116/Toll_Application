import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/winVehicleReportModule.dart';

class PreviousReportManikganjDatabase extends ChangeNotifier {
  List<ShortReportModel> previousDataListManikganj = [];

  void getPreviousReport() {
    try {
      previousDataListManikganj.clear();
      DatabaseReference reference = FirebaseDatabase.instance.reference();
      reference.child("manikganj").onValue.listen((event) async  {
        var data = event.snapshot.value;
        previousDataListManikganj.clear();

        for(var i = 1; i <= 7; i++){
          var weeklyDate = DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(Duration(days: i)));

          if(data[weeklyDate] != null){
            var dailyData = ShortReportModel.fromJson(data[weeklyDate]['short']);
            previousDataListManikganj.add(ShortReportModel(
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