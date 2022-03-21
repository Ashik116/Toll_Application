import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/manikganjTodyDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/previousManikganjData.dart';
import 'package:toll_plaza/Pages/Manikganj/GrapManikganj.dart';
import 'package:toll_plaza/Pages/Manikganj/previousReportManikganj.dart';
import 'package:toll_plaza/Pages/Manikganj/todayReportManikganj.dart';
import 'package:toll_plaza/Pages/Teesta/reportSearch.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class ManikganjReportPage extends StatefulWidget {
  @override
  _ManikganjReportPageState createState() => _ManikganjReportPageState();
}

class _ManikganjReportPageState extends State<ManikganjReportPage> {
  bool isLoading = true;
  double _height, _width;
  double _pixelRatio;

  getData() async {
    try{

     // await Future.delayed(Duration(seconds: 5));
      await context.read<TodayReportManikganjDatabase>().getShortReport();
      await context.read<TodayReportManikganjDatabase>().getReport();

      await context.read<PreviousReportManikganjDatabase>().getPreviousReport();

      await context.read<PreviousReportManikganjDatabase>().previousDataListManikganj;

    /*await context
          .read<TodayReportTeestaDataModule>()
          .getYesterdayVehicleData(
          "http://103.150.65.66/api/api/yesterday.php");//test
      await context
          .read<TodayVipPassReportTeestaDataModule>()
          .getYesterdayReportData(
          "http://103.150.65.66/api/api/yesterdayvippass.php");//test
      await context
          .read<TodayReportTeestaDataModule>()
          .getTodayReportData("http://103.150.65.66/api/api/today.php");*/

      setState(() {
        isLoading = false;
      });
    }catch(e){}
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
    Future.delayed(Duration(seconds: 1)).then((value) => {
          setState(() {
            isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    if(isLoading){
      return Container(
        color: providerThemeAndColor.backgroundColor,
        child: Center(
          child: Lottie.asset('assets/json/loading.json'),
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
                        "Manikganj Report",
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
                Tab(text: "THIS WEEK"),
                Tab(text: "GRAPH"),
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
