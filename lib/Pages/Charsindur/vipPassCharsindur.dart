import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Pages/Charsindur/previousVipPassCharsindur.dart';
import 'package:toll_plaza/Pages/Charsindur/previousvipclass.dart';
import 'package:toll_plaza/Pages/Charsindur/todayVipPassCharsindur.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class VipPassCharsindurUpdate extends StatefulWidget {
  @override
  _VipPassCharsindurUpdateState createState() =>
      _VipPassCharsindurUpdateState();
}

class _VipPassCharsindurUpdateState extends State<VipPassCharsindurUpdate> {
  bool _todayButtonSelected;
  bool _previousButtonSelected;
  bool _previousVIPSelected;
  int initialIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _todayButtonSelected = true;
    _previousButtonSelected = false;
    _previousVIPSelected = false;
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
          totalSwitches: 3,
          //radiusStyle: true,
          animate: true,
          curve: Curves.decelerate,
          labels: ['Total', 'Previous', 'Vehicle Class'],
          onToggle: (index) {
            setState(() {
              initialIndex = index;
              if (index == 0) {
                _todayButtonSelected = true;
                _previousButtonSelected = false;
                _previousVIPSelected = false;
              } else if (index == 1) {
                _todayButtonSelected = false;
                _previousButtonSelected = true;
                _previousVIPSelected = false;
              } else {
                _todayButtonSelected = false;
                _previousButtonSelected = false;
                _previousVIPSelected = true;
              }
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: _todayButtonSelected
              ? TodayVipPassCharsindur()
              : _previousVIPSelected
                  ? PreviousVipClassCharsindurUpdate()
                  : PreviousVipPassCharsindur(),
        )
      ],
    );
  }
}
