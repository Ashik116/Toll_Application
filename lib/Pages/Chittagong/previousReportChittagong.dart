import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/winVehicleReportModule.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/previousChittagongData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';


class PreviousReportChittagong extends StatefulWidget {
  @override
  _PreviousReportChittagongState createState() =>
      _PreviousReportChittagongState();
}

class _PreviousReportChittagongState extends State<PreviousReportChittagong> {
  @override
  Widget build(BuildContext context) {
    final previousReport =
        Provider.of<PreviousReportChittagongDatabase>(context);
    return previousReport.previousDataListChittagong.isNotEmpty
        ? ListView.builder(
            itemCount: previousReport.previousDataListChittagong.length,
            itemBuilder: (context, snapshot) {
              if(previousReport.previousDataListChittagong[snapshot]!=null){
                return _widgetBuilder(previousReport.previousDataListChittagong[snapshot]);
              }else{
                return null;
              }

            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _widgetBuilder(ShortReportModel previousReportData) {
    final themeAndColor = Provider.of<ThemeAndColorProvider>(context);

    return Card(
      elevation: 20,
      color: themeAndColor.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(previousReportData.date,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: themeAndColor.thirdTextColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .8)),
                flex: 3,
              ),
              Expanded(
                flex: 7,
                child: Card(
                  color: themeAndColor.secondColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Total: " + previousReportData.total,
                          style: TextStyle(
                              fontSize: 16,
                              color: themeAndColor.secondTextColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .8),
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Regular: \n" + previousReportData.regular,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: themeAndColor.secondTextColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .8),
                            )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                child: Text(
                              "ctrl+R: \n" + previousReportData.ctrlR,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .8),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
