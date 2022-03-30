import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/previousReportTeestaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/previousVIPReportTeestaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/todayReportTeestaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/todayVipPassReportTeestaDataModule.dart';
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
          "http://103.150.65.122/api/api/yesterday.php");//test
      await context
          .read<TodayVipPassReportTeestaDataModule>()
          .getYesterdayReportData(
          "http://103.150.65.122/api/api/yesterdayvippass.php");//test


      int time = int.parse(DateFormat.H().format(DateTime.now()).toString());

      if (time < 7) {
        //------- data get to api 12 am to 7 am ------------
        await context
            .read<TodayReportTeestaDataModule>()
            .getTodayReportData("http://103.150.65.122/api/api/yesterday.php");
        await context
            .read<TodayVipPassReportTeestaDataModule>()
            .getTodayReportData("http://103.150.65.122/api/api/yesterdayvippass.php");
      } else {
        //------- data get to api 7 am to 12 am ------------
        await context
            .read<TodayReportTeestaDataModule>()
            .getTodayReportData("http://103.150.65.122/api/api/today.php");
        await context
            .read<TodayVipPassReportTeestaDataModule>()
            .getTodayReportData("http://103.150.65.122/api/api/vippass.php");
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
                        "Teesta Toll Report",
                        style: TextStyle(color: providerThemeAndColor.textColor),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ReportSearch()));
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
                  color: providerThemeAndColor.indicatorColor,
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
