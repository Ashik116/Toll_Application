import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'package:toll_plaza/Provider/getData.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'package:toll_plaza/splashScreen.dart';

import 'DatabaseModule/Teesta/previousReportTeestaDataModule.dart';
import 'DatabaseModule/Teesta/previousVIPReportTeestaDataModule.dart';
import 'DatabaseModule/Teesta/todayReportTeestaDataModule.dart';
import 'DatabaseModule/Teesta/todayVipPassReportTeestaDataModule.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    Provider<TodayReportChittagongDatabase>(
        create: (_) => TodayReportChittagongDatabase()),
    Provider<PreviousReportChittagongDatabase>(
        create: (_) => PreviousReportChittagongDatabase()),
    Provider<TodayReportManikganjDatabase>(
        create: (_) => TodayReportManikganjDatabase()),
    Provider<PreviousReportManikganjDatabase>(
        create: (_) => PreviousReportManikganjDatabase()),
    Provider<PreviousReportCharsindurDataModule>(
        create: (_) => PreviousReportCharsindurDataModule()),
    Provider<PreviousVIPReportCharsindurDataModule>(
        create: (_) => PreviousVIPReportCharsindurDataModule()),
    Provider<TodayReportCharsindurDataModule>(
        create: (_) => TodayReportCharsindurDataModule()),
    Provider<TodayVipPassReportCharsindurDataModule>(
        create: (_) => TodayVipPassReportCharsindurDataModule()),
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
    Provider<TodayVipPassReportMohanondaDataModule>(
        create: (_) => TodayVipPassReportMohanondaDataModule()),
    Provider<ThemeAndColorProvider>(create: (_) => ThemeAndColorProvider()),
    ChangeNotifierProvider(create: (_) => GetData()),
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
      print("mainPage SharedPreferences: " + e.toString());
    }
  }
}
