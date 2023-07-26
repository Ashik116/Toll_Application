import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Pages/Bhangga/Bhanga%20Repot/Graph/todayRevenueGraph.dart';
import 'package:toll_plaza/Pages/Bhangga/Bhanga%20Repot/Graph/todayVehicleGraph.dart';
import 'package:toll_plaza/Pages/Teesta/previousRevenueGraphTeesta.dart';
import 'package:toll_plaza/Pages/Teesta/previousVehicleGraphTeesta.dart';
import 'package:toll_plaza/Pages/Teesta/todayRevenueGraphTeesta.dart';
import 'package:toll_plaza/Pages/Teesta/todayVehicleGraphTeesta.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

import 'PreviousRevenueGraph.dart';
import 'PreviousVehicleGraph.dart';

class GraphBhanga extends StatefulWidget {
  @override
  _GraphBhangaState createState() => _GraphBhangaState();
}

class _GraphBhangaState extends State<GraphBhanga> {
  bool _todayOrPreviousSelected = true;
  bool _vehicleOrRevenueSelected = true;
  int initialIndex1 = 0;
  int initialIndex2 = 0;

  @override
  void initState() {
    super.initState();
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
          initialLabelIndex: initialIndex1,
          cornerRadius: 20.0,
          activeBgColor: [providerThemeAndColor.toggleActiveColor,Colors.black],
          activeFgColor: Colors.white,
          inactiveBgColor: providerThemeAndColor.toggleInactiveColor,
          inactiveFgColor: Colors.white,
          totalSwitches: 2,
          //radiusStyle: true,
          animate: true,
          curve: Curves.decelerate,
          labels: ['Vehicle', 'Revenue'],
          onToggle: (index) {
            setState(() {
              initialIndex1 = index;
              if (index == 0) {
                _vehicleOrRevenueSelected = true;
              } else {
                _vehicleOrRevenueSelected = false;
              }
            });
          },
        ),
        SizedBox(height: 10,),
        ToggleSwitch(
          minWidth: MediaQuery.of(context).size.width * 0.25,
          fontSize: 16.0,
          initialLabelIndex: initialIndex2,
          cornerRadius: 20.0,
          activeBgColor: [Colors.black,providerThemeAndColor.toggleActiveColor],
          activeFgColor: Colors.white,
          inactiveBgColor: providerThemeAndColor.toggleInactiveColor,
          inactiveFgColor: Colors.white,
          totalSwitches: 2,
          //radiusStyle: true,
          animate: true,
          curve: Curves.decelerate,
          labels: ['Today', 'Previous'],
          onToggle: (index) {
            setState(() {
              initialIndex2 = index;
              if (index == 0) {
                _todayOrPreviousSelected = true;
              } else {
                _todayOrPreviousSelected = false;
              }
            });
          },
        ),
        Expanded(
          child: setPage(),
        )
      ],
    );
  }

  Widget setPage() {
    if (_vehicleOrRevenueSelected) {
      if (_todayOrPreviousSelected) {
        return TodayVehicleGraphBhanga();
      } else {
        return PreviousVehicleGraphBhanga();
      }
    } else {
      if (_todayOrPreviousSelected) {
        return TodayRevenueGraphBhanga();
      } else {
        return PreviousRevenueGraphBhanga();
      }
    }
  }
}
