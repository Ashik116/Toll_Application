import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toll_plaza/Model/mohanondaReportModel.dart';
import 'package:toll_plaza/Model/previousDayReportModel.dart';
import 'package:toll_plaza/Model/searchModel.dart';
import 'package:toll_plaza/Model/vipprevreport.dart';

class GetMohanondaData extends ChangeNotifier {
  MohanondaReportModel mohanondaReportModel;
  SearchModel searchModel;
  PreviousDayModel previousDayModel;
  VipPreviousReport vipPreviousReport;

  Future<List> get_dateReport() async {
    final response = await http.get(
        "http://103.145.118.20/api/api/previousDay.php?start_date=2021-06-10&end_date=2021-06-14");
    var data = json.decode(response.body.toString());

    print(data);
    mohanondaReportModel = MohanondaReportModel.fromJson(data);

    notifyListeners();
  }

  Future<List> search_report(
      String sDate, String eDate, String _class, String cat) async {
    /* if (searchModel.data != null) {
      searchModel.data.clear();
    }*/

    final response = await http.get(
        "http://103.145.118.20/api/api/search.php?start_date=${sDate}&end_date=${eDate}&class=${_class}&type=${cat}");
    var data = json.decode(response.body.toString());

    print(data);
    searchModel = SearchModel.fromJson(data);

    notifyListeners();
  }

  Future<List> get_previosreportmohanonda() async {
    final response =
        await http.get("http://103.145.118.20/api/api/previousdays.php");
    var data = json.decode(response.body.toString());

    print(data);
    previousDayModel = PreviousDayModel.fromJson(data);
    notifyListeners();
  }

  Future<List> get_vippreviosreportmohanonda() async {
    final response =
        await http.get("http://103.145.118.20/api/api/previousvippass.php");
    var data = json.decode(response.body.toString());

    print(data);
    vipPreviousReport = VipPreviousReport.fromJson(data);
    notifyListeners();
  }
}
