import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/winVehicleReportModule.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/previousChittagongData.dart';
import 'package:toll_plaza/Pages/Chittagong/todayReportChittagong.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';


class PreviousReportChittagong extends StatefulWidget {
  @override
  _PreviousReportChittagongState createState() => _PreviousReportChittagongState();
}

class _PreviousReportChittagongState extends State<PreviousReportChittagong> {
  @override
  Widget build(BuildContext context) {
    final previousReport = Provider.of<PreviousReportChittagongDatabase>(context);
    return previousReport.previousDataListChittagong.isNotEmpty ?
    ListView.builder(
      itemCount: previousReport.previousDataListChittagong.length,
      itemBuilder: (context, snapshot) {
        if (previousReport.previousDataListChittagong[snapshot] != null) {
          return _widgetBuilder(previousReport.previousDataListChittagong[snapshot]);
        } else {
          return null;
        }},
    ) :
    Center(
      child: loadingAnimation(),
    );
  }

  Widget _widgetBuilder(ShortReportModel previousReportData) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    String overload = (int.parse(previousReportData.regular) - int.parse(previousReportData.notOverload)).toString();
    return Card(
      elevation: 20,
      color: providerThemeAndColor.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(previousReportData.date,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: providerThemeAndColor.thirdTextColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8
                    )
                ),
              ),
              Expanded(
                flex: 8,
                child: Card(
                  color: providerThemeAndColor.sevenDaysCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Total ${previousReportData.total}",
                          style: TextStyle(
                              fontSize: 16,
                              color: providerThemeAndColor.highlighterTextColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.8
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        height: 1,
                        color: providerThemeAndColor.backgroundColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Overload\n$overload",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: providerThemeAndColor.secondTextColor,
                                    fontWeight: FontWeight.w600,
                                    //letterSpacing: 0.8
                                  ),
                                )
                            ),
                            Container(
                              height: 40,
                              child: VerticalDivider(
                                thickness: 2,
                                color: providerThemeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Regular\n${previousReportData.regular}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: providerThemeAndColor.secondTextColor,
                                  fontWeight: FontWeight.w600,
                                  //letterSpacing: 0.8
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              child: VerticalDivider(
                                thickness: 2,
                                color: providerThemeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Ctrl+R\n${previousReportData.ctrlR}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16 ,
                                    color: Colors.red[800],
                                    fontWeight: FontWeight.w600,
                                    //letterSpacing: 0.8,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Axel2\n${previousReportData.axel2}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: providerThemeAndColor.secondTextColor,
                                    fontWeight: FontWeight.w600,
                                    //letterSpacing: 0.8
                                  ),
                                )
                            ),
                            Container(
                              height: 40,
                              child: VerticalDivider(
                                thickness: 2,
                                color: providerThemeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Axel3\n${previousReportData.axel3}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: providerThemeAndColor.secondTextColor,
                                  fontWeight: FontWeight.w600,
                                  //letterSpacing: 0.8
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              child: VerticalDivider(
                                thickness: 2,
                                color: providerThemeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Axel4\n${previousReportData.axel4}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16 ,
                                    color: providerThemeAndColor.secondTextColor,
                                    fontWeight: FontWeight.w600,
                                    //letterSpacing: 0.8,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Axel4\n${previousReportData.axel5}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: providerThemeAndColor.thirdTextColor,
                                    fontWeight: FontWeight.w600,
                                    //letterSpacing: 0.8
                                  ),
                                )
                            ),
                            Container(
                              height: 40,
                              child: VerticalDivider(
                                thickness: 2,
                                color: providerThemeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Axel6\n${previousReportData.axel6}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: providerThemeAndColor.secondTextColor,
                                  fontWeight: FontWeight.w600,
                                  //letterSpacing: 0.8
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              child: VerticalDivider(
                                thickness: 2,
                                color: providerThemeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Axel7\n${previousReportData.axel7}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16 ,
                                    color: providerThemeAndColor.secondTextColor,
                                    fontWeight: FontWeight.w600,
                                    //letterSpacing: 0.8,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),

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

