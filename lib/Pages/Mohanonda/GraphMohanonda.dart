import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
