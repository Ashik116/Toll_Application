import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/previousReportMohanondaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/previousVIPReportMohanondaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/todayReportMohanondaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/todayVipPassReportMohanondaDataModule.dart';
import 'package:toll_plaza/Pages/Mohanonda/MohanondaReportSearch.dart';
import 'package:toll_plaza/Pages/Mohanonda/previousReportMohanonda2.dart';
import 'package:toll_plaza/Pages/Mohanonda/todayReportMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/vipPassMohanonda.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

import 'GraphMohanonda.dart';

class MohanondaReportPage extends StatefulWidget {
  @override
  _MohanondaReportPageState createState() => _MohanondaReportPageState();
}

class _MohanondaReportPageState extends State<MohanondaReportPage> {
  bool isLoading = true;
  bool large;
  bool medium;

  getData() async {
    try {
      await context.read<PreviousReportMohanondaDataModule>().getReport();

      await context.read<PreviousVIPReportMohanondaDataModule>().getReport();
      //test
      await context
          .read<TodayReportMohanondaDataModule>()
          .getYesterdayVehicleData("http://103.145.118.20/api/api/yesterday.php");

      await context
          .read<TodayVipPassReportMohanondaDataModule>()
          .getYesterdayReportData("http://103.145.118.20/api/api/yesterdayvippass.php");//test

      int time = int.parse(DateFormat.H().format(DateTime.now()).toString());

      if (time < 7) {
        //------- data get to api 12 am to 7 am ------------
        await context
            .read<TodayReportMohanondaDataModule>()
            .getTodayReportData("http://103.145.118.20/api/api/yesterday.php");
        await context
            .read<TodayVipPassReportMohanondaDataModule>()
            .getTodayReportData("http://103.145.118.20/api/api/yesterdayvippass.php");

      } else {
        //------- data get to api 7 am to 12 am ------------
        await context
            .read<TodayReportMohanondaDataModule>()
            .getTodayReportData("http://103.145.118.20/api/api/today.php");
        await context
            .read<TodayVipPassReportMohanondaDataModule>()
            .getTodayReportData("http://103.145.118.20/api/api/vippass.php");
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {

    }
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
                        "Mohanonda Toll Report",
                        style: TextStyle(color: providerThemeAndColor.textColor),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => MohanondaReportSearch()));
                        })
                  ],
                )
            ),
            bottom: TabBar(
              isScrollable: true,
              indicator: RectangularIndicator(
                  bottomLeftRadius: 100,
                  bottomRightRadius: 100,
                  topLeftRadius: 100,
                  topRightRadius: 100,
                  color:  Colors.black26,
                  horizontalPadding: 5,
                  verticalPadding: 5
              ),
              labelStyle: TextStyle(color: providerThemeAndColor.textColor),
              indicatorColor: providerThemeAndColor.textColor,
              labelColor: providerThemeAndColor.textColor,
              tabs: [
                Tab(child: Text('TODAY', style: TextStyle(fontWeight: FontWeight.bold),),),
                Tab(child: Text('PREVIOUS', style: TextStyle(fontWeight: FontWeight.bold),),),
                Tab(child: Text('GRAPH', style: TextStyle(fontWeight: FontWeight.bold),),),
                Tab(child: Text('VIP PASS', style: TextStyle(fontWeight: FontWeight.bold),),),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TodayReportMohanonda(),
              PreviousReportMohanonda2(),
              GraphMohanonda(),
              VipPassMohanonda(),
            ],
          ),
        ),
      );
    }
  }
}
