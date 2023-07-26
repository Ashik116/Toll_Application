import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DesignModule/eachRowDesign.dart';
import 'package:toll_plaza/Provider/getBhangaData.dart';
import 'package:toll_plaza/Provider/getDhaleshwariData.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousVipPassBhanga extends StatefulWidget {
  @override
  _PreviousVipPassBhangaState createState() => _PreviousVipPassBhangaState();
}

class _PreviousVipPassBhangaState extends State<PreviousVipPassBhanga> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  bool isLoading = true;

  @override
  void initState() {
    var fetchData = Provider.of<GetBhangaData>(context, listen: false);
    fetchData.get_vippreviosreportBhanga().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);

    return isLoading ? loadingAnimation() : Consumer<GetBhangaData>(builder: (content, data, child) {
      return data.vipPreviousReport != null ?
      AnimatedList(
        key: _listKey,
        initialItemCount: data.vipPreviousReport.data.length,
        itemBuilder: (BuildContext context, int index, Animation<double> animation) {
          index = index - 1;
          return SlideInRight(
            //for animation
            duration: Duration(milliseconds: 150),
            child: index == -1 ?
            EachRowDesign(
              firstColumnData: "Date",
              secondColumnData: "Vehicles",
              firstColumnFontColor: providerThemeAndColor.secondTextColor,
              secondColumnFontColor: providerThemeAndColor.secondTextColor,
              fontWeight: FontWeight.bold,
              backgroundColor: providerThemeAndColor.barHighlighterColor,
              dividerColor: Colors.red.shade700,
            ) :
            EachRowDesign(
              firstColumnData: data.vipPreviousReport.data[index].date,
              secondColumnData: data.vipPreviousReport.data[index].totalVehicles.toString(),
              firstColumnFontColor: providerThemeAndColor.secondTextColor,
              secondColumnFontColor: providerThemeAndColor.secondTextColor,
              fontWeight: FontWeight.bold,
              backgroundColor: providerThemeAndColor.backgroundColor,
            ),
          );},
      ) : loadingAnimation();
    });
  }
}
