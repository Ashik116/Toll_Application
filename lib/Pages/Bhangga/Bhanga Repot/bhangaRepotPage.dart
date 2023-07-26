import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DatabaseModule/Bhanga/todayReportBhangaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Bhanga/todayVipPassReportBhangaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Dhaleshwari/todayReportDhaleshwariDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Dhaleshwari/todayVipPassReportDhaleshwariDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/previousReportMohanondaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/previousVIPReportMohanondaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/todayReportMohanondaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/todayVipPassReportMohanondaDataModule.dart';
import 'package:toll_plaza/Pages/Bhangga/Bhanga%20Repot/previousRepotBhanga.dart';
import 'package:toll_plaza/Pages/Bhangga/Bhanga%20Repot/todayReportBhanga.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/Graph/graphDhaleshwari.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/Report/previousReport.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/Report/todayReportDhaleshwari.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/vipPassDhaleshwari.dart';
import 'package:toll_plaza/Pages/Mohanonda/GraphMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/MohanondaReportSearch.dart';
import 'package:toll_plaza/Pages/Mohanonda/previousReportMohanonda2.dart';
import 'package:toll_plaza/Pages/Mohanonda/todayReportMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/vipPassMohanonda.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

import '../reportSearch.dart';
import 'Graph/GraphBhanga.dart';
import 'VIP Pass/VipPassBhanga.dart';


class BhangaReportPage extends StatefulWidget {
  @override
  _BhangaReportPageState createState() => _BhangaReportPageState();
}

class _BhangaReportPageState extends State<BhangaReportPage> {
  bool isLoading = true;
  bool large;
  bool medium;

  getData() async {
    try {
      await context.read<PreviousReportMohanondaDataModule>().getReport();

      await context.read<PreviousVIPReportMohanondaDataModule>().getReport();
      //test
      await context
          .read<TodayReportDhaleshwariDataModule>()
          .getYesterdayVehicleData(
          "http://103.239.254.102//api/api/yesterday.php");

      await context
          .read<TodayVipPassReportMohanondaDataModule>()
          .getYesterdayReportData(
          "http://103.239.254.102/api/api/yesterdayvippass.php"); //test

      int time = int.parse(DateFormat.H().format(DateTime.now()).toString());

      if (time < 12) {
        //------- data get to api 12 am to 7 am ------------
        await context
            .read<TodayReportBhangaDataModule>()
            .getTodayReportData("http://103.239.254.102/api/api/yesterday.php");
        await context
            .read<TodayVipPassReportBhangaDataModule>()
            .getTodayReportData(
            "http://103.239.254.102/api/api/yesterdayvippass.php");
      } else {
        //------- data get to api 8 am to 12 am ------------
        await context
            .read<TodayReportBhangaDataModule>()
            .getTodayReportData("http://103.239.254.102/api/api/today.php");
        await context
            .read<TodayVipPassReportBhangaDataModule>()
            .getTodayReportData("http://103.239.254.102/api/api/vippass.php");
      }

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
                        "Bhanga ETC Toll Report",
                        style:
                        TextStyle(color: providerThemeAndColor.textColor),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BhangaReportSearch()));
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
                  color: Colors.black26,
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
              TodayReportBhanga(),
              PreviousReportBhanga(),
              GraphBhanga(),
              VipPassBhanga(),
            ],
          ),
        ),
      );
    }
  }
}
