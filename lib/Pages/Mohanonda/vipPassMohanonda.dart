import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Pages/Mohanonda/previousVipPassMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/todayVipPassMohanonda.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class VipPassMohanonda extends StatefulWidget {
  @override
  _VipPassMohanondaState createState() => _VipPassMohanondaState();
}

class _VipPassMohanondaState extends State<VipPassMohanonda> {
  bool _todayButtonSelected;
  bool _previousButtonSelected;

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
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _todayButtonSelected = true;
                  _previousButtonSelected = false;
                });
              },
              child: Text("Today"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              elevation: 10,
              textColor: providerThemeAndColor.textColor,
              color: _todayButtonSelected
                  ? providerThemeAndColor.mainColor
                  : providerThemeAndColor.secondColor,
              animationDuration: Duration(milliseconds: 500),
            ),
            SizedBox(
              width: 10,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _todayButtonSelected = false;
                  _previousButtonSelected = true;
                });
              },
              child: Text("Previous"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              elevation: 10,
              textColor: providerThemeAndColor.textColor,
              color: _previousButtonSelected
                  ? providerThemeAndColor.mainColor
                  : providerThemeAndColor.secondColor,
              animationDuration: Duration(milliseconds: 500),
            ),
          ],
        ),
        Expanded(
          child: _todayButtonSelected
              ? TodayVipPassMohanonda()
              : PreviousVipPassMohanonda(),
        )
      ],
    );
  }
}
