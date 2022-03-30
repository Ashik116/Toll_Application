import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PreviousVIPReportCharsindurDataModule extends ChangeNotifier{
  var date;
  var vehicles;
  var weeklyDate;


  PreviousVIPReportCharsindurDataModule({this.date,this.vehicles});

  List<PreviousVIPReportCharsindurDataModule> _dataList = <PreviousVIPReportCharsindurDataModule>[];

  List<PreviousVIPReportCharsindurDataModule> get dataList => _dataList;

  getReport(){
    try{
      DatabaseReference reference = FirebaseDatabase.instance.reference();
      reference.child("PreviousVip").onValue.listen((event)  {
        var data = event.snapshot.value;
        dataList.clear();

        for(var i = 1; i <= 7; i++) {
          weeklyDate = DateFormat("dd-MM-yyyy").format(DateTime.now().subtract(Duration(days: i)));
          if(data[weeklyDate] != null) {
            dataList.add(PreviousVIPReportCharsindurDataModule(
                date: weeklyDate,
                vehicles: data[weeklyDate])
            );
          }
        }
      });


    }catch(e){

    }
    notifyListeners();
  }
}