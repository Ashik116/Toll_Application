import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Pages/Bhangga/Bhanga%20Repot/VIP%20Pass/todayVipPass.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/previousVipPassDhaleshwari.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/previousVipPassreport.dart';
import 'package:toll_plaza/Pages/Dhaleshwari/todayVipPassDhaleshwari.dart';
import 'package:toll_plaza/Pages/Mohanonda/previousVipPassMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/todayVipPassMohanonda.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'package:toll_plaza/Pages/Mohanonda/PreviousVipClassMohanonda.dart';

import 'PreviousVipClassBhanga.dart';
import 'PreviousVipPassBhanga.dart';

class VipPassBhanga extends StatefulWidget {
  @override
  _VipPassBhangaState createState() => _VipPassBhangaState();
}

class _VipPassBhangaState extends State<VipPassBhanga> {
  bool _todayButtonSelected;
  //bool _previousButtonSelected;
  bool _previousVIPSelected;
  int initialIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _todayButtonSelected = true;
    //_previousButtonSelected = false;
    _previousVIPSelected = false;
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
            totalSwitches: 3,
            //radiusStyle: true,
            animate: true,
            curve: Curves.decelerate,
            labels: ['Today', 'Previous', 'Vehicle Class'],
            onToggle: (index) {
              setState(() {
                initialIndex = index;
                if (index == 0) {
                  _todayButtonSelected = true;
                  //_previousButtonSelected = false;
                  _previousVIPSelected = false;
                } else if (index == 1) {
                  _todayButtonSelected = false;
                  //_previousButtonSelected = true;
                  _previousVIPSelected = false;
                } else {
                  _todayButtonSelected = false;
                  //_previousButtonSelected = false;
                  _previousVIPSelected = true;
                }
              });
            },
          ),
          SizedBox(height: 5,),
          Expanded(
            child: _todayButtonSelected ? TodayVipPassBhanga() : _previousVIPSelected
                ? PreviousVipClassBhanga()
                :PreviousVipPassBhanga(),
          )
        ],
      ),
    );
  }
}
