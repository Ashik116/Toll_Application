import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Pages/Charsindur/previousreportCharsindur3.dart';
import 'package:toll_plaza/Pages/Charsindur/sevenDaysCharsindur.dart';
import 'package:toll_plaza/Pages/Regnum%20Charsindur/previoussevenDayReport.dart';
import 'package:toll_plaza/Pages/Regnum%20Charsindur/sevenDaysVehicle.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class RegnumPreviousReportCharsindur extends StatefulWidget {
  @override
  _RegnumPreviousReportCharsindurState createState() =>
      _RegnumPreviousReportCharsindurState();
}

class _RegnumPreviousReportCharsindurState extends State<RegnumPreviousReportCharsindur> {
  bool _todayButtonSelected;
  bool _previousButtonSelected;
  int initialIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _todayButtonSelected = true;
    _previousButtonSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
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
                _previousButtonSelected = false;
              } else {
                _todayButtonSelected = false;
                _previousButtonSelected = true;
              }
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: _todayButtonSelected
              ? PreviousReportRegnumCharsindurUpdate()
              : sevenDaysVehicleDataRegnumCharsindur(),
        )
      ],
    );
  }
}
