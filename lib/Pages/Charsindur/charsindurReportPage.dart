import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousVIPReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayVipPassReportCharsindurDataModule.dart';
import 'package:toll_plaza/Pages/Charsindur/GraphCharsindur.dart';
import 'package:toll_plaza/Pages/Charsindur/previousReportCharsindur.dart';
import 'package:toll_plaza/Pages/Charsindur/todayReport.dart';
import 'package:toll_plaza/Pages/Charsindur/vipPassCharsindur.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class CharsindurReportPage extends StatefulWidget {
  @override
  _CharsindurReportPageState createState() => _CharsindurReportPageState();
}

class _CharsindurReportPageState extends State<CharsindurReportPage> {
  bool isLoading = true;

  getData() async {
    try {
      await context.read<PreviousReportCharsindurDataModule>().getReport();

      await context.read<PreviousVIPReportCharsindurDataModule>().getReport();

      int time = int.parse(DateFormat.H().format(DateTime.now()).toString());

      if (time < 7) {
        //------- data get to api 12 am to 7 am ------------
        await context
            .read<TodayReportCharsindurDataModule>()
            .getTodayReportData("http://103.150.65.66/api/yesterday.php");
        await context
            .read<TodayVipPassReportCharsindurDataModule>()
            .getTodayReportData(
                "http://103.150.65.66/api/yesterdayvippass.php");
      } else {
        //------- data get to api 7 am to 12 am ------------
        await context
            .read<TodayReportCharsindurDataModule>()
            .getTodayReportData("http://103.150.65.66/api/today.php");
        await context
            .read<TodayVipPassReportCharsindurDataModule>()
            .getTodayReportData("http://103.150.65.66/api/vippass.php");
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
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    if (isLoading) {
      return Container(
        color: providerThemeAndColor.backgroundColor,
        child: Center(
          child: loadingAnimation(),
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
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlue[200], Colors.lightGreen[200]]
                ),
              ),
            ),
            title: Text(
              "Charsindur Report",
              style: TextStyle(color: providerThemeAndColor.textColor),
            ),
            bottom: TabBar(
              isScrollable: true,
              indicator: RectangularIndicator(
                  bottomLeftRadius: 100,
                  bottomRightRadius: 100,
                  topLeftRadius: 100,
                  topRightRadius: 100,
                  color:  Colors.black26,
                  horizontalPadding: 5, verticalPadding: 5
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
              TodayReportCharsindur(),
              PreviousReportCharsindur(),
              GraphCharsindur(),
              VipPassCharsindur(),
            ],
          ),
        ),
      );
    }
  }
}
