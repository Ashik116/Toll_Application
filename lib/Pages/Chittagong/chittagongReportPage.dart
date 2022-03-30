import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/Pages/Chittagong/GraphChittagong.dart';
import 'package:toll_plaza/Pages/Chittagong/previousReportChittagong.dart';
import 'package:toll_plaza/Pages/Chittagong/todayReportChittagong.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class ChittagongReportPage extends StatefulWidget {
  @override
  _ChittagongReportPageState createState() => _ChittagongReportPageState();
}

class _ChittagongReportPageState extends State<ChittagongReportPage> {
  bool isLoading = true;

  // getData() {
  //   try{
  //     context.read<TodayReportChittagongDatabase>().getShortReport();
  //     context.read<TodayReportChittagongDatabase>().getReport();
  //     context.read<PreviousReportChittagongDatabase>().getPreviousReport();
  //
  //     // setState(() {
  //     //   isLoading = false;
  //     // });
  //   }catch(e){
  //     return true;
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
    Future.delayed(Duration(seconds: 5)).then((value) => {
      setState(() {
        isLoading = false;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    //bool isDark = providerThemeAndColor.darkTheme;
    return isLoading ? loadingAnimation() :
    DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: providerThemeAndColor.backgroundColor,
        appBar: AppBar(
          actions: [],
          iconTheme:
          IconThemeData(color: providerThemeAndColor.iconColor),
          backgroundColor: providerThemeAndColor.mainColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: providerThemeAndColor.appBarColor,
              ),
            ),
          ),
          title: Text(
            "Chittagong Toll Report",
            style: TextStyle(color: providerThemeAndColor.textColor),
          ),
          bottom: TabBar(
            indicator: RectangularIndicator(
                bottomLeftRadius: 100,
                bottomRightRadius: 100,
                topLeftRadius: 100,
                topRightRadius: 100,
                color: providerThemeAndColor.indicatorColor,
                horizontalPadding: 5,
                verticalPadding: 5,
            ),
            labelStyle: TextStyle(color: providerThemeAndColor.textColor),
            indicatorColor: providerThemeAndColor.textColor,
            labelColor: providerThemeAndColor.textColor,
            tabs: <Widget>[
              Tab(child: Text(
                'TODAY',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              ),
              Tab(child: Text(
                'THIS WEEK',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              ),
              Tab(child: Text(
                'GRAPH',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TodayReportChittagong(),
            PreviousReportChittagong(),
            GraphChittagong(),
          ],
        ),
      ),
    );
  }
}
