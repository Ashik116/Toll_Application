import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Pages/Charsindur/graph/previousGraphVchielCharsindur.dart';
import 'package:toll_plaza/Pages/Charsindur/graph/previousRevenueGraph.dart';
import 'package:toll_plaza/Pages/Charsindur/graph/todaVehicelgraph.dart';
import 'package:toll_plaza/Pages/Charsindur/graph/todayRevenueGraph.dart';
import 'package:toll_plaza/Pages/Regnum%20Charsindur/Graph/perviousVehicleGraph.dart';
import 'package:toll_plaza/Pages/Regnum%20Charsindur/Graph/previousRevenueGraph.dart';
import 'package:toll_plaza/Pages/Regnum%20Charsindur/Graph/todayRevenueGraphregnum.dart';
import 'package:toll_plaza/Pages/Regnum%20Charsindur/Graph/todayVehicleGraph.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';


class GraphregnumCharsindur extends StatefulWidget {
  @override
  _GraphregnumCharsindurState createState() => _GraphregnumCharsindurState();
}

class _GraphregnumCharsindurState extends State<GraphregnumCharsindur> {
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
        SizedBox(
          height: 10,
        ),
        ToggleSwitch(
          minWidth: MediaQuery.of(context).size.width * 0.7,
          fontSize: 16.0,
          initialLabelIndex: initialIndex1,
          cornerRadius: 20.0,
          activeBgColor: [Colors.black,providerThemeAndColor.toggleActiveColor],
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
        SizedBox(
          height: 10,
        ),
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
        return TodayVehicleGraphRegnumCharsindur(); //TodayVehicleGraphTeesta//PreviousVehicleGraphTeesta
      } else {
        return PreviousVehicleGraphRegnumCharsindur();
      }
    } else {
      if (_todayOrPreviousSelected) {
        return TodayRevenueGraphRegnumCharsindur(); //TodayRevenueGraphTeesta
      } else {
        return PreviousRevenueGraphRegnumCharsindur();
      }
    }
  }
}
