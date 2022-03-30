import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Pages/Netrokona/previousGraphNetrokona.dart';
import 'package:toll_plaza/Pages/Netrokona/todayGraphNetrokona.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class GraphNetrokona extends StatefulWidget {
  const GraphNetrokona({Key key}) : super(key: key);

  @override
  _GraphNetrokonaState createState() => _GraphNetrokonaState();
}

class _GraphNetrokonaState extends State<GraphNetrokona> {
  bool _todayOrPreviousSelected = true;
  int initialIndex = 0;

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
          initialLabelIndex: initialIndex,
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
              initialIndex = index;
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
    if (_todayOrPreviousSelected) {
      return TodayGraphNetrokona();
    } else {
      return PreviousGraphNetrokona();
    }
  }
}
