import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Pages/Bhangga/Bhanga%20Repot/previousTotalReportBhanga.dart';
import 'package:toll_plaza/Pages/Bhangga/Bhanga%20Repot/sevenDayDataBhanga.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/Report/previousTotal.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/Report/previoussevendayData.dart';
import 'package:toll_plaza/Pages/Mohanonda/previousReportMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/sevenDaysDataMohanonda.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousReportBhanga extends StatefulWidget {
  @override
  _PreviousReportBhangaState createState() => _PreviousReportBhangaState();
}

class _PreviousReportBhangaState extends State<PreviousReportBhanga> {
  bool _todayButtonSelected;

  int initialIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _todayButtonSelected = true;

  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightBlue.shade200,Colors.lightGreen.shade200,]
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          ToggleSwitch(
            minWidth: MediaQuery.of(context).size.width * 0.7,
            fontSize: 16.0,
            initialLabelIndex: initialIndex,
            cornerRadius: 20.0,
            activeBgColor: [providerThemeAndColor.toggleActiveColor,Colors.black],
            activeFgColor: Colors.white,
            inactiveBgColor: providerThemeAndColor.toggleInactiveColor,
            inactiveFgColor: Colors.white,
            totalSwitches: 2,
            //radiusStyle: true,
            animate: true,
            curve: Curves.decelerate,
            labels: ['Total', 'Vehicle Class'],
            onToggle: (index) {
              setState(() {
                initialIndex = index;
                if (index == 0) {
                  _todayButtonSelected = true;
                } else {
                  _todayButtonSelected = false;
                }
              });
            },
          ),
          SizedBox(height: 10,),
          Expanded(
            child: _todayButtonSelected
                ? PreviousTotalReportBhanga()
                : SevenDaysDataBhanga(),
          )
        ],
      ),
    );
  }
}