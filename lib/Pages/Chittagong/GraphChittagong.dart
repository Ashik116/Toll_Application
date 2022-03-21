import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Pages/Chittagong/TodayGraphChittagong.dart';
import 'package:toll_plaza/Pages/Chittagong/previousGraphChittagong.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';




class GraphChittagong extends StatefulWidget {
  @override
  _GraphChittagongState createState() => _GraphChittagongState();
}

class _GraphChittagongState extends State<GraphChittagong> {
  bool _todayOrPreviousSelected = true;

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
    if(_todayOrPreviousSelected){
      return TodayGraphChittagong();
    }else{
      return PreviousGraphChittagong();
    }

  }

}
