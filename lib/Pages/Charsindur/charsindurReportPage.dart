import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousVIPReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayVipPassReportCharsindurDataModule.dart';
import 'package:toll_plaza/Pages/Charsindur/previousReportCharsindur2.dart';
import 'package:toll_plaza/Pages/Charsindur/reportSearch.dart';
import 'package:toll_plaza/Pages/Charsindur/todayReport.dart';
import 'package:toll_plaza/Pages/Charsindur/vipPassCharsindur.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

import 'graph/NewGraph.dart';

// import 'GraphTeesta.dart';
// import 'PreviousReportTeesta2.dart';

class CharsindurUpdateReportPage extends StatefulWidget {
  @override
  _CharsindurUpdateReportPageState createState() =>
      _CharsindurUpdateReportPageState();
}

class _CharsindurUpdateReportPageState
    extends State<CharsindurUpdateReportPage> {
  bool isLoading = true;

  bool large;
  bool medium;

  getData() async {
    try {
      await context.read<PreviousReportDataModuleCharsindur>().getReport();

      await context.read<PreviousReportDataModuleCharsindur>().getData2();

      await context.read<PreviousVIPReportDataModuleCharsindur>().getReport();

      await context
          .read<TodayReportCharsindurDataModule1>()
          .getYesterdayVehicleData(
              "http://103.95.99.139/api/api/yesterday.php"); //test
      await context
          .read<TodayVipPassCharsindurReportDataModule>()
          .getYesterdayReportData(
              "http://103.95.99.139/api/api/yesterdayvippass.php"); //test

      int time = int.parse(DateFormat.H().format(DateTime.now()).toString());

      if (time < 12) {
        //------- data get to api 12 am to 7 am ------------
        await context
            .read<TodayReportCharsindurDataModule1>()
            .getTodayReportData("http://103.95.99.139/api/api/yesterday.php");
        await context
            .read<TodayVipPassCharsindurReportDataModule>()
            .getTodayReportData(
                "http://103.95.99.139/api/api/yesterdayvippass.php");
      } else {
        //------- data get to api 7 am to 12 am ------------
        await context
            .read<TodayReportCharsindurDataModule1>()
            .getTodayReportData("http://103.95.99.139/api/api/today.php");
        await context
            .read<TodayVipPassCharsindurReportDataModule>()
            .getTodayReportData("http://103.95.99.139/api/api/vippass.php");
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
                        "CharSindur Toll Report",
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
                                  builder: (_) => ReportSearchCharsindur()));
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
              TodayReportCharsindurUpdate(),
              PreviousReportCharsindur2(),
              GraphCharsindur1(),
              VipPassCharsindurUpdate(),
            ],
          ),
        ),
      );
    }
  }
}
