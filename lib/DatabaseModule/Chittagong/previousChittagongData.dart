import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/winVehicleReportModule.dart';

class PreviousReportChittagongDatabase extends ChangeNotifier {
  List<ShortReportModel> previousDataListChittagong = [];

  getPreviousReport() {
    try {
      previousDataListChittagong.clear();
      DatabaseReference reference = FirebaseDatabase.instance.reference();

      reference.child("chittagong2").onValue.listen((event)  {
        var data = event.snapshot.value;
        previousDataListChittagong.clear();

        for(var i = 1; i <= 7; i++){
          var weeklyDate = DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(Duration(days: i)));

          if(data[weeklyDate] != null){
            var dailyData = ShortReportModel.fromJson(data[weeklyDate]['short1']);
            previousDataListChittagong.add(ShortReportModel(
                total: dailyData.total,
                regular: dailyData.regular,
                ctrlR: dailyData.ctrlR,
                notOverload: dailyData.notOverload,
                axel2: dailyData.axel2,
                axel3: dailyData.axel3,
                axel4: dailyData.axel4,
                axel5: dailyData.axel5,
                axel6: dailyData.axel6,
                axel7: dailyData.axel7,
                date: weeklyDate));}
        }
      });
    } catch (e) {

    }
    notifyListeners();
  }
}