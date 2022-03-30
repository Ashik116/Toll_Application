import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousVIPReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayVipPassReportCharsindurDataModule.dart';
import 'package:toll_plaza/Pages/Charsindur/GraphCharsindur.dart';
import 'package:toll_plaza/Pages/Charsindur/vipPassCharsindur.dart';
import 'package:toll_plaza/Pages/Teesta/previousReportTeesta.dart';
import 'package:toll_plaza/Pages/Teesta/reportSearch.dart';
import 'package:toll_plaza/Pages/Teesta/todayReportTeesta.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class DemoTeesta extends StatefulWidget {
  @override
  _DemoTeestaState createState() => _DemoTeestaState();
}

class _DemoTeestaState extends State<DemoTeesta> {
  bool isLoading = true;

  double _height, _width;
  double _pixelRatio;
  bool large;
  bool medium;

  getData() async {
    try {
      await context.read<PreviousReportCharsindurDataModule>().getReport();

      await context.read<PreviousVIPReportCharsindurDataModule>().getReport();

      int time = int.parse(DateFormat.H().format(DateTime.now()).toString());

      if (time < 7) {
        //------- data get to api 12 am to 7 am ------------
        await context
            .read<TodayReportCharsindurDataModule>()
            .getTodayReportData("http://103.95.99.166/api/yesterday.php");
        await context
            .read<TodayVipPassReportCharsindurDataModule>()
            .getTodayReportData(
                "http://103.95.99.166/api/yesterdayvippass.php");
      } else {
        //------- data get to api 7 am to 12 am ------------
        await context
            .read<TodayReportCharsindurDataModule>()
            .getTodayReportData("http://103.95.99.166/api/today.php");
        await context
            .read<TodayVipPassReportCharsindurDataModule>()
            .getTodayReportData("http://103.95.99.166/api/vippass.php");
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
          //child: Lottie.asset('assets/json/loading.json'),
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
            title: Container(
                width: _width,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Teesta Report",
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
              PreviousReportTeesta(),
              GraphCharsindur(),
              VipPassCharsindur(),
            ],
          ),
        ),
      );
    }
  }
}
