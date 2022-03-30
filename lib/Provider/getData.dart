import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toll_plaza/Model/SevenDaysDataModel.dart';
import 'package:toll_plaza/Model/previousDayReportModel.dart';
import 'package:toll_plaza/Model/searchModel.dart';
import 'package:toll_plaza/Model/teestaReportModel.dart';
import 'package:toll_plaza/Model/vipprevreport.dart';

class GetData extends ChangeNotifier {
  TeestaReportModel teestaReportModel;
  SearchModel searchModel;
  PreviousDayModel previousDayModel;
  VipPreviousReport vipPreviousReport;
  SevenDaysDataModel sevenDaysData, sevenDaysVipPass;

  Future<List> get_dateReport() async {
    final response = await http.get(
        "http://103.182.219.34/api/api/previousDay.php?start_date=2021-06-10&end_date=2021-06-14");
    var data = json.decode(response.body.toString());

    teestaReportModel = TeestaReportModel.fromJson(data);
    notifyListeners();
  }

  Future<List> search_report(
      String sDate, String eDate, String _class, String cat) async {
    /* if (searchModel.data != null) {
      searchModel.data.clear();
    }*/

    final response = await http.get(
        "http://103.182.219.34/api/api/search.php?start_date=${sDate}&end_date=${eDate}&class=${_class}&type=${cat}");
    var data = json.decode(response.body.toString());

    //print(data);
    searchModel = SearchModel.fromJson(data);

    notifyListeners();
  }

  Future<List> get_previosreportteesta() async {
    final response =
        await http.get("http://103.182.219.34/api/api/previousdays.php");
    var data = json.decode(response.body.toString());

    //print(data);
    previousDayModel = PreviousDayModel.fromJson(data);

    notifyListeners();
  }

  Future<List> get_vippreviosreportteesta() async {
    final response =
        await http.get("http://103.182.219.34/api/api/previousvippass.php");
    var data = json.decode(response.body.toString());

    //print(data);
    vipPreviousReport = VipPreviousReport.fromJson(data);

    notifyListeners();
  }

  Future<List> get_sevenDaysData() async {
    final response = await http
        .get("http://103.182.219.34/api/api/sevendaysdatavehicledetails.php");
    var data = json.decode(response.body.toString());

    //print(data);
    sevenDaysData = SevenDaysDataModel.fromJson(data);

    notifyListeners();
  }

  Future<List> get_sevenDaysVipPass() async {
    final response = await http.get(
        "http://103.182.219.34/api/api/sevendaysdatavehicledetailsvippass.php");
    var data = json.decode(response.body.toString());

    // print(data);
    sevenDaysVipPass = SevenDaysDataModel.fromJson(data);

    notifyListeners();
  }
}
