//Flutter sdk-2.2.3
//Dart sdk-2.13.4

import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toll_plaza/DatabaseModule/Bhanga/todayReportBhangaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousVIPReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/todayVipPassReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/chittagongTodyDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/previousChittagongData.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/manikganjTodyDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/previousManikganjData.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/previousReportMohanondaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/previousVIPReportMohanondaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/todayReportMohanondaDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Mohanonda/todayVipPassReportMohanondaDataModule.dart';
import 'package:toll_plaza/DesignModule/teestaPhotoView.dart';
import 'package:toll_plaza/Provider/getBhangaData.dart';
import 'package:toll_plaza/Provider/getData.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'package:toll_plaza/splashScreen.dart';

import 'DatabaseModule/Bhanga/previousReportTeestaDataModule.dart';
import 'DatabaseModule/Bhanga/previousVIPReportBhangaDataModule.dart';
import 'DatabaseModule/Bhanga/todayVipPassReportBhangaDataModule.dart';
import 'DatabaseModule/Dhaleshwari/todayReportDhaleshwariDataModule.dart';
import 'DatabaseModule/Dhaleshwari/todayVipPassReportDhaleshwariDataModule.dart';
import 'DatabaseModule/Netrokona/netrokonaTodayDataModule.dart';
import 'DatabaseModule/Netrokona/previousNetrokonaData.dart';
import 'DatabaseModule/Regnum Charsindur/previousReportregnumCharsindurDataModule.dart';
import 'DatabaseModule/Regnum Charsindur/previousVIPReportDataModuleRegnumCharsindur.dart';
import 'DatabaseModule/Regnum Charsindur/todayReportRegnumCharsindurDataModule.dart';
import 'DatabaseModule/Regnum Charsindur/todayVIPPassReportRegnumCharsindurDataModule.dart';
import 'DatabaseModule/Teesta/previousReportTeestaDataModule.dart';
import 'DatabaseModule/Teesta/previousVIPReportTeestaDataModule.dart';
import 'DatabaseModule/Teesta/todayReportTeestaDataModule.dart';
import 'DatabaseModule/Teesta/todayVipPassReportTeestaDataModule.dart';
import 'Provider/getCharsindurData.dart';
import 'Provider/getDhaleshwariData.dart';
import 'Provider/getRegnumCharsindurData.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  // await NotificationWidget.init();
  // NotificationWidget.showNotification(
  //     id: 1, title: "Teesta Toll", body: "Check your Running Fund!");
  // NotificationWidget.asshowNotification(
  //     id: 2, title: "Mohanonda Toll", body: "Check your Running Fund!");
  // NotificationWidget.eighthowNotification(
  //     id: 3, title: "Teesta Toll ", body: "Check your Running Fund!");
  // NotificationWidget.ninhowNotification(
  //     id: 4, title: "Mohanonda Toll", body: "Check your Running Fund!");
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  runApp(MultiProvider(providers: [
    Provider<TodayReportChittagongDatabase>(
        create: (_) => TodayReportChittagongDatabase()),
    Provider<PreviousReportChittagongDatabase>(
        create: (_) => PreviousReportChittagongDatabase()),
    Provider<TodayReportManikganjDatabase>(
        create: (_) => TodayReportManikganjDatabase()),
    Provider<PreviousReportManikganjDatabase>(
        create: (_) => PreviousReportManikganjDatabase()),
    Provider<TodayReportNetrokonaDatabase>(
        create: (_) => TodayReportNetrokonaDatabase()),
    Provider<PreviousReportNetrokonaDatabase>(
        create: (_) => PreviousReportNetrokonaDatabase()),
    Provider<PreviousReportDataModuleCharsindur>(
        create: (_) => PreviousReportDataModuleCharsindur()),
    Provider<PreviousReportDataModuleRegnumCharsindur>(
        create: (_) => PreviousReportDataModuleRegnumCharsindur()),
    Provider<PreviousVIPReportDataModuleCharsindur>(
        create: (_) => PreviousVIPReportDataModuleCharsindur()),
    Provider<PreviousVIPReportDataModuleRegnumCharsindur>(
        create: (_) => PreviousVIPReportDataModuleRegnumCharsindur()),
    Provider<TodayReportCharsindurDataModule1>(
        create: (_) => TodayReportCharsindurDataModule1()),
    Provider<TodayReportRegnumCharsindurDataModule1>(
        create: (_) => TodayReportRegnumCharsindurDataModule1()),
    Provider<TodayVipPassCharsindurReportDataModule>(
        create: (_) => TodayVipPassCharsindurReportDataModule()),
    Provider<TodayVipPassRegnumCharsindurReportDataModule>(
        create: (_) => TodayVipPassRegnumCharsindurReportDataModule()),
    Provider<PreviousReportTeestaDataModule>(
        create: (_) => PreviousReportTeestaDataModule()),
    Provider<PreviousVIPReportTeestaDataModule>(
        create: (_) => PreviousVIPReportTeestaDataModule()),
    Provider<TodayReportTeestaDataModule>(
        create: (_) => TodayReportTeestaDataModule()),
    Provider<TodayVipPassReportTeestaDataModule>(
        create: (_) => TodayVipPassReportTeestaDataModule()),
    Provider<PreviousReportMohanondaDataModule>(
        create: (_) => PreviousReportMohanondaDataModule()),
    Provider<PreviousVIPReportMohanondaDataModule>(
        create: (_) => PreviousVIPReportMohanondaDataModule()),
    Provider<TodayReportMohanondaDataModule>(
        create: (_) => TodayReportMohanondaDataModule()),
    Provider<TodayReportDhaleshwariDataModule>(create: (_) => TodayReportDhaleshwariDataModule()),
    Provider<TodayVipPassReportDhaleshwariDataModule>(create: (_) => TodayVipPassReportDhaleshwariDataModule()),
    Provider<TodayVipPassReportMohanondaDataModule>(
        create: (_) => TodayVipPassReportMohanondaDataModule()),
    Provider<TodayReportBhangaDataModule>(
        create: (_) => TodayReportBhangaDataModule()),
    Provider<TodayVipPassReportBhangaDataModule>(
        create: (_) => TodayVipPassReportBhangaDataModule()),
    Provider<PreviousReportBhangaDataModule>(
        create: (_) => PreviousReportBhangaDataModule()),
    Provider<PreviousVIPReportBhangaDataModule>(
        create: (_) => PreviousVIPReportBhangaDataModule()),
    Provider<ThemeAndColorProvider>(create: (_) => ThemeAndColorProvider()),
    ChangeNotifierProvider(create: (_) => GetData()),
    ChangeNotifierProvider(create: (_) => GetBhangaData()),
    ChangeNotifierProvider(create: (_) => GetDhaleshwariData()),
    ChangeNotifierProvider(create: (_) => GetDataCharsindur()),
    ChangeNotifierProvider(create: (_) => GetDataRegnumCharsindur()),
    ChangeNotifierProvider(create: (_) => GetMohanondaData()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeSetUp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Regnum Toll',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreenPage(),
        routes: <String, WidgetBuilder>{
          "/photoView": (BuildContext context) => TeestaPhotoView(),
        });
  }

  Future<void> themeSetUp() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool darkTheme = prefs.getBool('darkTheme');
      if (darkTheme != null)
        context.read<ThemeAndColorProvider>().setDarkTheme(darkTheme);
      else
        context.read<ThemeAndColorProvider>().setDarkTheme(false);
    } catch (e) {
      // print("mainPage SharedPreferences: " + e.toString());
    }
  }
}
