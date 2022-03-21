import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/previousReportTeestaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/previousVIPReportTeestaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/todayReportTeestaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/todayVipPassReportTeestaDataModule.dart';
import 'package:toll_plaza/Pages/Teesta/previousReportTeesta.dart';
import 'package:toll_plaza/Pages/Teesta/reportSearch.dart';
import 'package:toll_plaza/Pages/Teesta/todayReportTeesta.dart';
import 'package:toll_plaza/Pages/Teesta/vipPassTeesta.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

import 'GraphTeesta.dart';
import 'PreviousReportTeesta2.dart';

class TeestaReportPage extends StatefulWidget {
  @override
  _TeestaReportPageState createState() => _TeestaReportPageState();
}

class _TeestaReportPageState extends State<TeestaReportPage> {
  bool isLoading = true;

  double _height, _width;
  double _pixelRatio;
  bool large;
  bool medium;

  getData() async {
    try {
      await context.read<PreviousReportTeestaDataModule>().getReport();

      await context.read<PreviousReportTeestaDataModule>().getData2();

      await context.read<PreviousVIPReportTeestaDataModule>().getReport();

      await context
          .read<TodayReportTeestaDataModule>()
          .getYesterdayVehicleData(
          "http://103.150.65.66/api/api/yesterday.php");//test
      await context
          .read<TodayVipPassReportTeestaDataModule>()
          .getYesterdayReportData(
          "http://103.150.65.66/api/api/yesterdayvippass.php");//test


      int time = int.parse(DateFormat.H().format(DateTime.now()).toString());

      if (time < 7) {
        //------- data get to api 12 am to 7 am ------------
        await context
            .read<TodayReportTeestaDataModule>()
            .getTodayReportData("http://103.150.65.66/api/api/yesterday.php");
        await context
            .read<TodayVipPassReportTeestaDataModule>()
            .getTodayReportData(
                "http://103.150.65.66/api/api/yesterdayvippass.php");
      } else {
        //------- data get to api 7 am to 12 am ------------
        await context
            .read<TodayReportTeestaDataModule>()
            .getTodayReportData("http://103.150.65.66/api/api/today.php");
        await context
            .read<TodayVipPassReportTeestaDataModule>()
            .getTodayReportData("http://103.150.65.66/api/api/vippass.php");
      }

      //print(context.read<TodayReportCharsindurDataModule>().totalYesterdayVehicle.toString());
      setState(() {
        isLoading = false;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    if (isLoading) {
      return Container(
        color: providerThemeAndColor.backgroundColor,
        child: Center(
          child: Lottie.asset('assets/json/loading.json'),
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
                    colors: [Colors.lightBlue[200], Colors.lightGreen[200]]
                ),
              ),
            ),
            title: Container(
                width: _width,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Teesta Bridge Toll Report",
                        style: TextStyle(color: providerThemeAndColor.textColor),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ReportSearch()));
                        })
                  ],
                )),
            bottom: TabBar(
              labelStyle: TextStyle(color: providerThemeAndColor.textColor),
              indicatorColor: providerThemeAndColor.textColor,
              labelColor: providerThemeAndColor.textColor,
              tabs: [
                Tab(text: "TODAY"),
                Tab(text: "PREVIOUS"),
                Tab(text: "GRAPH"),
                Tab(text: "VIP PASS"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TodayReportTeesta(),
              PreviousReportTeesta2(),
              GraphTeesta(),
              VipPassTeesta(),
            ],
          ),
        ),
      );
    }
  }
}
