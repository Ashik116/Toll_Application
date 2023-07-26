import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PreviousReportDataModuleRegnumCharsindur extends ChangeNotifier {
  var date;
  var dailyTotalAmount;
  var vehicles;

  PreviousReportDataModuleRegnumCharsindur(
      {this.date, this.vehicles, this.dailyTotalAmount});

  List<PreviousReportDataModuleRegnumCharsindur> _dataList = [];
  List<PreviousReportDataModuleRegnumCharsindur> get dataList => _dataList;

  List<PreviousReportDataModuleRegnumCharsindur> _dataList2 = [];
  List<PreviousReportDataModuleRegnumCharsindur> get dataList2 => _dataList2;

  getData2() async {
    try {
      var response =
      await http.get("http://103.95.99.139:8080/api/api/previousdays.php");
      var jsonData = json.decode(response.body)["data"] as List;
      dataList2.clear();
      var i = 1;
      for (var json in jsonData) {
        var weeklyDate = DateFormat("dd-MM-yyyy")
            .format(DateTime.now().subtract(Duration(days: i)));
        if (json != null) {
          dataList2.add(PreviousReportDataModuleRegnumCharsindur.fromJson2(json));
        }
        i++;
      }
      if (dataList2.length > 7) {
        dataList2.remove(dataList2.last);
      }
    } catch (e) {}
  }

  getReport() {
    try {
      DatabaseReference reference = FirebaseDatabase.instance.reference();
      reference.child("Norshinddi").onValue.listen((event) {
        var data = event.snapshot.value;
        dataList.clear();
        for (var i = 1; i <= 7; i++) {
          var weeklyDate = DateFormat("dd-MM-yyyy")
              .format(DateTime.now().subtract(Duration(days: i)));
          if (data[weeklyDate] != null) {
            dataList.add(
                PreviousReportDataModuleRegnumCharsindur.fromJson(data[weeklyDate]));
          }
        }
      });
    } catch (e) {}
    notifyListeners();
  }

  PreviousReportDataModuleRegnumCharsindur.fromJson(Map<dynamic, dynamic> json) {
    date = json['date'];
    dailyTotalAmount = json['dayTotalAmount'];
    vehicles = json['vichelAmount'];
  }
  PreviousReportDataModuleRegnumCharsindur.fromJson2(Map<dynamic, dynamic> json) {
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
