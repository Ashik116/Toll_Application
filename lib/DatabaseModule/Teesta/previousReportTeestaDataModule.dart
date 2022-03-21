import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
class PreviousReportTeestaDataModule extends ChangeNotifier {
  var date;
  var dailyTotalAmount;
  var vehicles;

  PreviousReportTeestaDataModule(
      {this.date, this.vehicles, this.dailyTotalAmount});

  List<PreviousReportTeestaDataModule> _dataList = List();
  List<PreviousReportTeestaDataModule> get dataList => _dataList;


  List<PreviousReportTeestaDataModule> _dataList2 = List();
  List<PreviousReportTeestaDataModule> get dataList2 => _dataList2;

  getData2() async {
    try{
    var response =await http.get("http://103.150.65.66/api/api/previousdays.php");

    var jsonData = json.decode(response.body)["data"] as List;//['data'] as List;
    dataList2.clear();
    var i=1;
    for (var u in jsonData ){

      var weeklyDate = DateFormat("yyyy-MM-dd")
          .format(DateTime.now().subtract(Duration(days: i)));
      print("test  "+PreviousReportTeestaDataModule.fromJson2(u).toString());
      if (u  != null){
      dataList2
          .add(PreviousReportTeestaDataModule.fromJson2(u));}
      i++;
    }
    }catch(e){

    }
  }
  getReport() {
    try {
      DatabaseReference reference = FirebaseDatabase.instance.reference();
      reference.child("Teesta").onValue.listen((event) {
        var data = event.snapshot.value;
        dataList.clear();
        for (var i = 1; i <= 7; i++) {
          var weeklyDate = DateFormat("dd-MM-yyyy")
              .format(DateTime.now().subtract(Duration(days: i)));
        //  print("test2 "+ data.toString() );
          if (data[weeklyDate] != null)
            dataList
                .add(PreviousReportTeestaDataModule.fromJson(data[weeklyDate]));
        }
      });
    } catch (e) {}
    notifyListeners();
  }

  PreviousReportTeestaDataModule.fromJson(Map<dynamic, dynamic> json) {
    date = json['date'];
    dailyTotalAmount = json['dayTotalAmount'];
    vehicles = json['vichelAmount'];
  }
  PreviousReportTeestaDataModule.fromJson2(Map<dynamic, dynamic> json) {
    date = json['date'].toString();
    dailyTotalAmount = json['amount'].toString();
    vehicles = json['Total_vehicles'].toString();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['date'] = this.date;
    data['dayTotalAmount'] = this.dailyTotalAmount;
    data['vichelAmount'] = this.vehicles;
    return data;
  }
}
