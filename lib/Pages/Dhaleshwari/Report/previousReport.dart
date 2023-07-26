import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/Report/previousTotal.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/Report/previoussevendayData.dart';
import 'package:toll_plaza/Pages/Mohanonda/previousReportMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/sevenDaysDataMohanonda.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousReportDhaleshwari extends StatefulWidget {
  @override
  _PreviousReportDhaleshwariState createState() => _PreviousReportDhaleshwariState();
}

class _PreviousReportDhaleshwariState extends State<PreviousReportDhaleshwari> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        ToggleSwitch(
          minWidth: MediaQuery.of(context).size.width * 0.7,
          fontSize: 16.0,
          initialLabelIndex: initialIndex,
          cornerRadius: 20.0,
          activeBgColor: [Colors.black,providerThemeAndColor.toggleActiveColor],
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
              ? PreviousTotalReportDhaleshwari()
              : sevenDaysDataDhaleshwari(),
        )
      ],
    );
  }
}