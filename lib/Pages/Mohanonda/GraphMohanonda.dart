import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Pages/Mohanonda/previousRevenueGraphMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/previousVehicleGraphMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/todayRevenueGraphMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/todayVehicleGraphMohanonda.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class GraphMohanonda extends StatefulWidget {
  @override
  _GraphMohanondaState createState() => _GraphMohanondaState();
}

class _GraphMohanondaState extends State<GraphMohanonda> {
  bool _todayOrPreviousSelected = true;
  bool _vehicleOrRevenueSelected = true;
  int initialIndex1 = 0;
  int initialIndex2 = 0;

  @override
  void initState() {
    // TODO: implement initState
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
          activeBgColor: [providerThemeAndColor.toggleActiveColor],
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
          activeBgColor: [providerThemeAndColor.toggleActiveColor],
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
        return TodayVehicleGraphMohanonda();
      } else {
        return PreviousVehicleGraphMohanonda();
      }
    } else {
      if (_todayOrPreviousSelected) {
        return TodayRevenueGraphMohanonda();
      } else {
        return PreviousRevenueGraphMohanonda();
      }
    }
  }
}
