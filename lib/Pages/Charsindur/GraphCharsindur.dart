import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Pages/Charsindur/previousRevenueGraphCharsindur.dart';
import 'package:toll_plaza/Pages/Charsindur/previousVehicleGraphCharsindur.dart';
import 'package:toll_plaza/Pages/Charsindur/todayRevenueGraph.dart';
import 'package:toll_plaza/Pages/Charsindur/todayVehicleGraph.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';




class GraphCharsindur extends StatefulWidget {
  @override
  _GraphCharsindurState createState() => _GraphCharsindurState();
}

class _GraphCharsindurState extends State<GraphCharsindur> {
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

                  onPressed: (){
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
                  color: _vehicleOrRevenueSelected ? providerThemeAndColor.mainColor : providerThemeAndColor.secondColor,
                  animationDuration: Duration(milliseconds: 500),
                ),
              ),
              SizedBox(
                width: 10,
              ),

              Expanded(
                child: RaisedButton(
                  onPressed: (){
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
                  color: _vehicleOrRevenueSelected ? providerThemeAndColor.secondColor : providerThemeAndColor.mainColor,
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
              onPressed: (){
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
              color: _todayOrPreviousSelected ? providerThemeAndColor.mainColor : providerThemeAndColor.secondColor,
              animationDuration: Duration(milliseconds: 500),
            ),
            SizedBox(
              width: 10,
            ),
            RaisedButton(
              onPressed: (){
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
              color: _todayOrPreviousSelected ? providerThemeAndColor.secondColor : providerThemeAndColor.mainColor,
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
    if(_vehicleOrRevenueSelected){
      if(_todayOrPreviousSelected){
        return TodayVehicleGraph();
      }else{
       return PreviousVehicleGraphCharsindur();
      }
    }else{
      if(_todayOrPreviousSelected){
        return TodayRevenueGraph();
      }else{
        return PreviousRevenueGraphCharsindur();
      }
    }
  }

}
