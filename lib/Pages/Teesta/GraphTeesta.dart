import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Pages/Teesta/previousRevenueGraphTeesta.dart';
import 'package:toll_plaza/Pages/Teesta/previousVehicleGraphTeesta.dart';
import 'package:toll_plaza/Pages/Teesta/todayRevenueGraphTeesta.dart';
import 'package:toll_plaza/Pages/Teesta/todayVehicleGraphTeesta.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class GraphTeesta extends StatefulWidget {
  @override
  _GraphTeestaState createState() => _GraphTeestaState();
}

class _GraphTeestaState extends State<GraphTeesta> {
  bool _todayOrPreviousSelected = true;
  bool _vehicleOrRevenueSelected = true;

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
        Card(
          color: providerThemeAndColor.backgroundColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _vehicleOrRevenueSelected = true;
                    });
                  },
                  child: Text("Vehicle"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8),
                  elevation: 10,
                  textColor: providerThemeAndColor.textColor,
                  color: _vehicleOrRevenueSelected
                      ? providerThemeAndColor.mainColor
                      : providerThemeAndColor.secondColor,
                  animationDuration: Duration(milliseconds: 500),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _vehicleOrRevenueSelected = false;
                    });
                  },
                  child: Text("Revenue"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8),
                  elevation: 10,
                  textColor: providerThemeAndColor.textColor,
                  color: _vehicleOrRevenueSelected
                      ? providerThemeAndColor.secondColor
                      : providerThemeAndColor.mainColor,
                  animationDuration: Duration(milliseconds: 500),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _todayOrPreviousSelected = true;
                });
              },
              child: Text("Today"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              elevation: 10,
              textColor: providerThemeAndColor.textColor,
              color: _todayOrPreviousSelected
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
                  _todayOrPreviousSelected = false;
                });
              },
              child: Text("Previous"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              elevation: 10,
              textColor: providerThemeAndColor.textColor,
              color: _todayOrPreviousSelected
                  ? providerThemeAndColor.secondColor
                  : providerThemeAndColor.mainColor,
              animationDuration: Duration(milliseconds: 500),
            ),
          ],
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
        return TodayVehicleGraphTeesta();
      } else {
        return PreviousVehicleGraphTeesta();
      }
    } else {
      if (_todayOrPreviousSelected) {
        return TodayRevenueGraphTeesta();
      } else {
        return PreviousRevenueGraphTeesta();
      }
    }
  }
}
