import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Pages/Charsindur/previousVipPassCharsindur.dart';
import 'package:toll_plaza/Pages/Charsindur/todayVipPassCharsindur.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class VipPassCharsindur extends StatefulWidget {
  @override
  _VipPassCharsindurState createState() => _VipPassCharsindurState();
}

class _VipPassCharsindurState extends State<VipPassCharsindur> {
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
              ? TodayVipPassCharsindur()
              : PreviousVipPassCharsindur(),
        )
      ],
    );
  }
}
