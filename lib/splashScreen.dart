import 'package:animate_do/animate_do.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toll_plaza/checkLogin.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var isSplashing = true;

  void getData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        Future.delayed(Duration(seconds: 2)).then((value) async {
          Future.delayed(Duration(seconds: 2)).whenComplete(() {
            if (isSplashing) {
              snackBarMsg("Internet Connection is very slow");
            }
          });

          /*await context
              .read<TodayReportTeestaDataModule>()
              .getYesterdayVehicleData(
                  "http://103.150.65.66/api/yesterday.php");

          await context
              .read<TodayVipPassReportTeestaDataModule>()
              .getYesterdayReportData(
                  "http://103.150.65.66/api/yesterdayvippass.php");

          await context
              .read<TodayReportMohanondaDataModule>()
              .getYesterdayVehicleData(
              "http://103.145.118.20/api/yesterday.php");

          await context
              .read<TodayVipPassReportMohanondaDataModule>()
              .getYesterdayReportData(
              "http://103.145.118.20/api/yesterdayvippass.php");*/
          isSplashing = false;
          refresh();
          //-------data upload to firebase after 7 am to 12 am------------
          int time =
              int.parse(DateFormat.H().format(DateTime.now()).toString());
          if (time >= 7) {
            /*await YesterdayDataUploadToFirebaseTeesta()
                .upload(context.read<TodayReportTeestaDataModule>());

            await YesterdayDataUploadToFirebaseTeesta().uploadVIP(
                context.read<TodayVipPassReportTeestaDataModule>());

            await YesterdayDataUploadToFirebaseMohanonda()
                .upload(context.read<TodayReportMohanondaDataModule>());

            await YesterdayDataUploadToFirebaseMohanonda().uploadVIP(
                context.read<TodayVipPassReportMohanondaDataModule>());*/
          }
        });
      } catch (e) {}
    } else {
      snackBarMsg("Please check internet connection");
      getData();
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CheckLogIn()));
  }

  @override
  Widget build(BuildContext context) {
    return !isSplashing
        ? CheckLogIn()
        : Scaffold(
            key: _scaffoldKey,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/splash.jpg"),
                      fit: BoxFit.fill)),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadeInLeft(
                            duration: Duration(milliseconds: 800),
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: 150,
                              width: 150,
                            ),
                          ),
                          FadeInRight(
                            duration: Duration(milliseconds: 800),
                            child: Text(
                              "Regnum Toll Plaza",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: BounceInDown(
                          duration: Duration(milliseconds: 800),
                          child: Image.asset(
                            "assets/images/regnum.png",
                            height: 50,
                            width: 100,
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  void snackBarMsg(loginErrorMessage) {
    //print("ok");
    final snackBar = SnackBar(
      duration: Duration(seconds: 10),
      content: Text(
        loginErrorMessage.toString(),
        style: TextStyle(color: Colors.red),
      ),
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //_scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
}
