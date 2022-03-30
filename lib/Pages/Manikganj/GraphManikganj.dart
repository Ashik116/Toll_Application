import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toll_plaza/Pages/Manikganj/previousGraphManikganj.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'package:toll_plaza/Pages/Manikganj/TodayGraphManikganj.dart';

class GraphManikganj extends StatefulWidget {
  @override
  _GraphManikganjState createState() => _GraphManikganjState();
}

class _GraphManikganjState extends State<GraphManikganj> {
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
    if(_todayOrPreviousSelected){
      return TodayGraphManikganj();
    }else{
      return PreviousGraphManikganj();
    }
  }
}
