import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/manikganjTodyDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/previousManikganjData.dart';
import 'package:toll_plaza/Pages/Manikganj/GraphManikganj.dart';
import 'package:toll_plaza/Pages/Manikganj/previousReportManikganj.dart';
import 'package:toll_plaza/Pages/Manikganj/todayReportManikganj.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class ManikganjReportPage extends StatefulWidget {
  @override
  _ManikganjReportPageState createState() => _ManikganjReportPageState();
}

class _ManikganjReportPageState extends State<ManikganjReportPage> {
  bool isLoading = true;

  getData() async {
    try{
      context.read<TodayReportManikganjDatabase>().getShortReport();
      context.read<TodayReportManikganjDatabase>().getReport();
      context.read<PreviousReportManikganjDatabase>().getPreviousReport();

      setState(() {
        isLoading = false;
      });
    }catch(e){

    }
  }
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
    if(isLoading){
      return Container(
        color: providerThemeAndColor.backgroundColor,
        child: Center(
          child: loadingAnimation(),
        ),
      );
    }else{
      return DefaultTabController(
        length: 3,
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
                        "Manikganj Wim Report",
                        style: TextStyle(color: providerThemeAndColor.textColor),
                      ),
                    ),
                  ],
                )
            ),
            bottom: TabBar(
              indicator: RectangularIndicator(
                  bottomLeftRadius: 100,
                  bottomRightRadius: 100,
                  topLeftRadius: 100,
                  topRightRadius: 100,
                  color: providerThemeAndColor.indicatorColor,
                  horizontalPadding: 5, verticalPadding: 5
              ),
              labelStyle: TextStyle(color: providerThemeAndColor.textColor),
              indicatorColor: providerThemeAndColor.textColor,
              labelColor: providerThemeAndColor.textColor,
              tabs: [
                Tab(child: Text('TODAY', style: TextStyle(fontWeight: FontWeight.bold),),),
                Tab(child: Text('THIS WEEK', style: TextStyle(fontWeight: FontWeight.bold),),),
                Tab(child: Text('GRAPH', style: TextStyle(fontWeight: FontWeight.bold),),),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TodayReportManikganj(),
              PreviousReportManikganj(),
              GraphManikganj(),
            ],
          ),
        ),
      );
    }
  }
}