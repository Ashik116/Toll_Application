import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DesignModule/eachRowDesign.dart';
import 'package:toll_plaza/Provider/getData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousVipPassTeesta extends StatefulWidget {
  @override
  _PreviousVipPassTeestaState createState() => _PreviousVipPassTeestaState();
}

class _PreviousVipPassTeestaState extends State<PreviousVipPassTeesta> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  bool isLoading = true;

  @override
  void initState() {
    var fetchData = Provider.of<GetData>(context, listen: false);
    fetchData.get_vippreviosreportteesta().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    /*final previousVIPReportList =
        Provider.of<PreviousVIPReportTeestaDataModule>(context);*/
    return isLoading ? loadingAnimation() : Consumer<GetData>(builder: (content, data, child) {
      return data.vipPreviousReport != null ?
      AnimatedList(
        key: _listKey,
        initialItemCount: data.vipPreviousReport.data.length,
        itemBuilder: (BuildContext context, int index, Animation<double> animation) {
          index = index - 1;
          return SlideInRight(
            //for animation
            duration: Duration(milliseconds: 200),
            child: index == -1 ?
            EachRowDesign(
              firstColumnData: "Date",
              secondColumnData: "Vehicles",
              firstColumnFontColor: providerThemeAndColor.secondTextColor,
              //secondColumnFontColor: Colors.red,
              secondColumnFontColor: providerThemeAndColor.secondTextColor,
              fontWeight: FontWeight.bold,
              backgroundColor: providerThemeAndColor.barHighlighterColor,
              dividerColor: Colors.red.shade700,
            ) :
            EachRowDesign(
              firstColumnData: data.vipPreviousReport.data[index].date,
              secondColumnData: data.vipPreviousReport.data[index].totalVehicles.toString(),
              firstColumnFontColor: providerThemeAndColor.secondTextColor,
              //secondColumnFontColor: Colors.red,
              secondColumnFontColor: providerThemeAndColor.secondTextColor,
              fontWeight: FontWeight.bold,
              backgroundColor: providerThemeAndColor.backgroundColor,
            ),
          );},
      ) : loadingAnimation(); //Customdialog();
    });
  }
}
