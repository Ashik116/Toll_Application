
import 'package:auto_animated/auto_animated.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/chittagongTodyDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/previousChittagongData.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/manikganjTodyDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/previousManikganjData.dart';
import 'package:toll_plaza/DatabaseModule/Netrokona/netrokonaTodayDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Netrokona/previousNetrokonaData.dart';
import 'package:toll_plaza/DesignModule/Navigation_drawer.dart';
import 'package:toll_plaza/Pages/Charsindur/charsindurReportPage.dart';
import 'package:toll_plaza/Pages/Chittagong/chittagongReportPage.dart';
import 'package:toll_plaza/Pages/Manikganj/manikganjReportPage.dart';
import 'package:toll_plaza/Pages/Mohanonda/mohanondaReportPage.dart';
import 'package:toll_plaza/Pages/Netrokona/netrokonaReportPage.dart';
import 'package:toll_plaza/Pages/Teesta/teestaReportPage.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isRestricted = false;
  List itemGridList;
  List itemList;


  SharedPreferences sharedPreferences;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      context.read<TodayReportChittagongDatabase>().getShortReport();
      context.read<TodayReportChittagongDatabase>().getReport();
      context.read<PreviousReportChittagongDatabase>().getPreviousReport();

      context.read<TodayReportManikganjDatabase>().getShortReport();
      context.read<TodayReportManikganjDatabase>().getReport();
      context.read<PreviousReportManikganjDatabase>().getPreviousReport();

      context.read<TodayReportNetrokonaDatabase>().getShortReport();
      context.read<TodayReportNetrokonaDatabase>().getReport();
      context.read<PreviousReportNetrokonaDatabase>().getPreviousReport();

      setState(() {

      });
    } catch (e) {
      print(e.toString());
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
    bool isDark = providerThemeAndColor.darkTheme;

    Widget items(text, image, isDark, permission, route) {
      return InkWell(
        onTap: () {
          if (permission) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => route));
          } else {
            snackBarMsg('Permission Denied!');
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
                gradient: isDark ? LinearGradient(colors: [Colors.grey.shade900, Colors.grey.shade900]) : LinearGradient(colors: [Colors.lightBlue.shade200, Colors.lightGreen.shade200]),
              ),
              child: isDark ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.black54,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: context.watch<ThemeAndColorProvider>().textColor,
                    ),
                  ),
                ),
              ) :
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    gradient:LinearGradient(colors: [Colors.lightBlue.shade200.withOpacity(0.8), Colors.lightGreen.shade200.withOpacity(0.8)]),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  //color: Colors.black54,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: context.watch<ThemeAndColorProvider>().textColor,
                    ),
                  ),
                ),
              )
          ),
        ),
      );
    }
    itemGridList = [
      items(
        'Charsindur',
        'assets/images/charsindur.jpg',
        isDark,
        false,
        null,
        //sharedPreferences.getBool('isAdmin') || sharedPreferences.getBool('isCharsindur'),
        //CharsindurReportPage(),
      ),
      items(
        'Chittagong',
        'assets/images/chittagong_logo-min.png',
        isDark,
        sharedPreferences.getBool('isAdmin') || sharedPreferences.getBool('isChittagong'),
        ChittagongReportPage(),
      ),
      items(
        'Manikganj',
        'assets/images/manikganj.jpg',
        isDark,
        sharedPreferences.getBool('isAdmin') || sharedPreferences.getBool('isManikganj'),
        ManikganjReportPage(),
      ),
      items(
        'Netrokona',
        'assets/images/netrokona.jpg',
        isDark,
        true,
        //sharedPreferences.getBool('isAdmin') || sharedPreferences.getBool('isManikganj'),
        NetrokonaReportPage(),
      ),
      items(
        'Teesta',
        'assets/images/teesta.jpg',
        isDark,
        sharedPreferences.getBool('isAdmin') || sharedPreferences.getBool('isTeesta'),
        TeestaReportPage(),
      ),
      items(
        'Mohanonda',
        'assets/images/mohanonda.jpg',
        isDark,
        sharedPreferences.getBool('isAdmin') || sharedPreferences.getBool('isMohanonda'),
        MohanondaReportPage(),
      ),
    ];
    final _scrollController = ScrollController();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: providerThemeAndColor.backgroundColor,
      drawer: NavigationDrawer(darkSwitch, snackBarMsg, context),
      appBar: AppBar(
        iconTheme: IconThemeData(color: providerThemeAndColor.iconColor),
        backgroundColor: providerThemeAndColor.mainColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: providerThemeAndColor.appBarColor,
            ),
          ),
        ),
        title: Text(
          "Toll Plaza",
          style: TextStyle(color: providerThemeAndColor.textColor),
        ),
      ),


      body: Container(
          color: providerThemeAndColor.backgroundColor,
          padding: const EdgeInsets.only(top: 8.0),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              LiveSliverGrid(
                controller: _scrollController,
                showItemInterval: Duration(milliseconds: 100),
                showItemDuration: Duration(milliseconds: 200) ,
                itemCount: itemGridList.length,
                itemBuilder: buildAnimatedItemGrid,
                reAnimateOnVisibility: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ],
          )
      ),
    );
  }

  void darkSwitch() {
    setState(() {
      bool isDark = !context.read<ThemeAndColorProvider>().darkTheme;
      context.read<ThemeAndColorProvider>().setDarkTheme(isDark);
    });
  }

  Widget buildAnimatedItemGrid(BuildContext context, int index, Animation<double> animation) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        // Paste you Widget
        child: itemGridList[index],
      ),
    );
  }
  Widget buildAnimatedItemList(BuildContext context, int index, Animation<double> animation) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        // Paste you Widget
        child: itemList.first,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void snackBarMsg(String loginErrorMessage) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(
        loginErrorMessage.toString(),
        style: TextStyle(color: Colors.red),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
