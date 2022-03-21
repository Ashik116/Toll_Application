import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousVIPReportCharsindurDataModule.dart';
import 'package:toll_plaza/DesignModule/eachRowDesign.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';


class PreviousVipPassCharsindur extends StatefulWidget {
  @override
  _PreviousVipPassCharsindurState createState() => _PreviousVipPassCharsindurState();
}

class _PreviousVipPassCharsindurState extends State<PreviousVipPassCharsindur> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    final previousVIPReportList = Provider.of<PreviousVIPReportCharsindurDataModule>(context);
    return AnimatedList(
      key: _listKey,
      initialItemCount: previousVIPReportList.dataList.length+1,
      itemBuilder: (BuildContext context, int index, Animation<double> animation){
        index = index-1;
        return SlideInRight(
          //for animation
          duration: Duration(milliseconds: 800),
          child: index == -1? EachRowDesign(
            firstColumnData: "Date",
            secondColumnData: "Vehicles",
            firstColumnFontColor: providerThemeAndColor.secondTextColor,
            secondColumnFontColor: Colors.red,
            fontWeight: FontWeight.bold,
            backgroundColor: providerThemeAndColor.thirdColor,
          ) : EachRowDesign(
            firstColumnData: previousVIPReportList.dataList[index].date,
            secondColumnData: previousVIPReportList.dataList[index].vehicles,
            firstColumnFontColor: providerThemeAndColor.secondTextColor,
            secondColumnFontColor: Colors.red,
            fontWeight: FontWeight.bold,
            backgroundColor: providerThemeAndColor.backgroundColor,

          ),
        );
      },
    );
  }
}
