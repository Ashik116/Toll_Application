import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousVIPReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayVipPassReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Regnum%20Charsindur/previousReportregnumCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Regnum%20Charsindur/previousVIPReportDataModuleRegnumCharsindur.dart';
import 'package:toll_plaza/DatabaseModule/Regnum%20Charsindur/todayReportRegnumCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Regnum%20Charsindur/todayVIPPassReportRegnumCharsindurDataModule.dart';
import 'package:toll_plaza/Pages/Charsindur/graph/NewGraph.dart';
import 'package:toll_plaza/Pages/Charsindur/previousReportCharsindur2.dart';
import 'package:toll_plaza/Pages/Charsindur/reportSearch.dart';
import 'package:toll_plaza/Pages/Charsindur/todayReport.dart';
import 'package:toll_plaza/Pages/Charsindur/vipPassCharsindur.dart';
import 'package:toll_plaza/Pages/Regnum%20Charsindur/previousReportRegnumCharsindur.dart';
import 'package:toll_plaza/Pages/Regnum%20Charsindur/todayReportRegnum.dart';
import 'package:toll_plaza/Pages/Regnum%20Charsindur/vipPassRegnumCharsindur.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'Graph/graphRegnum.dart';
import 'reportSerachRegnumCharsindur.dart';


class RegnumCharsindurUpdateReportPage extends StatefulWidget {
  @override
  _RegnumCharsindurUpdateReportPageState createState() =>
      _RegnumCharsindurUpdateReportPageState();
}

class _RegnumCharsindurUpdateReportPageState
    extends State<RegnumCharsindurUpdateReportPage> {
  bool isLoading = true;

  bool large;
  bool medium;

  getData() async {
    try {
      await context.read<PreviousReportDataModuleRegnumCharsindur>().getReport();

      await context.read<PreviousReportDataModuleRegnumCharsindur>().getData2();

      await context.read<PreviousVIPReportDataModuleRegnumCharsindur>().getReport();

      await context
          .read<TodayReportRegnumCharsindurDataModule1>()
          .getYesterdayVehicleData(
          "http://103.95.99.139:8080/api/api/yesterday.php"); //test
      await context
          .read<TodayVipPassRegnumCharsindurReportDataModule>()
          .getYesterdayReportData(
          "http://103.95.99.139:8080/api/api/yesterdayvippass.php"); //test

      int time = int.parse(DateFormat.H().format(DateTime.now()).toString());

      if (time < 12) {
        //------- data get to api 12 am to 7 am ------------
        await context
            .read<TodayReportRegnumCharsindurDataModule1>()
            .getTodayReportData("http://103.95.99.139:8080/api/api/yesterday.php");
        await context
            .read<TodayVipPassRegnumCharsindurReportDataModule>()
            .getTodayReportData(
            "http://103.95.99.139:8080/api/api/yesterdayvippass.php");
      } else {
        //------- data get to api 7 am to 12 am ------------
        await context
            .read<TodayReportRegnumCharsindurDataModule1>()
            .getTodayReportData("http://103.95.99.139:8080/api/api/today.php");
        await context
            .read<TodayVipPassRegnumCharsindurReportDataModule>()
            .getTodayReportData("http://103.95.99.139:8080/api/api/vippass.php");
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {}
  }
  Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);

    if (isLoading) {
      return Container(
        color: providerThemeAndColor.backgroundColor,
        child: Center(
          child: loadingAnimation(),
        ),
      );
    } else {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: providerThemeAndColor.backgroundColor,
          appBar: AppBar(
            actions: [],
            iconTheme: IconThemeData(color: providerThemeAndColor.iconColor),
            backgroundColor: providerThemeAndColor.mainColor,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: providerThemeAndColor.appBarColor,
                ),
              ),
            ),
            title: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Regnum Charsindur Toll Report",
                        style:
                        TextStyle(
                            fontSize: 18,
                            color: providerThemeAndColor.textColor),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ReportSearchRegnumCharsindur()));
                        })
                  ],
                )),
            bottom: TabBar(
              isScrollable: true,
              indicator: RectangularIndicator(
                  bottomLeftRadius: 100,
                  bottomRightRadius: 100,
                  topLeftRadius: 100,
                  topRightRadius: 100,
                  color: providerThemeAndColor.indicatorColor,
                  horizontalPadding: 5,
                  verticalPadding: 5),
              labelStyle: TextStyle(color: providerThemeAndColor.textColor),
              indicatorColor: providerThemeAndColor.textColor,
              labelColor: providerThemeAndColor.textColor,
              tabs: [
                Tab(
                  child: Text(
                    'TODAY',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'PREVIOUS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'GRAPH',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'VIP PASS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TodayReportRegnumCharsindurUpdate(),
              RegnumPreviousReportCharsindur(),
              GraphregnumCharsindur(),
              VipPassRegnumCharsindurUpdate(),
            ],
          ),
        ),
      );
    }
  }
}
