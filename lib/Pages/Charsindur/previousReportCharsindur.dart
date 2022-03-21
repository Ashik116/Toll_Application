import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousReportCharsindurDataModule.dart';
import 'package:toll_plaza/DesignModule/eachRowDesign.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';


class PreviousReportCharsindur extends StatefulWidget {
  @override
  _PreviousReportCharsindurState createState() =>
      _PreviousReportCharsindurState();
}

class _PreviousReportCharsindurState extends State<PreviousReportCharsindur> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    final previousReportList = Provider.of<PreviousReportCharsindurDataModule>(context);
    return AnimatedList(
      key: _listKey,
      initialItemCount: previousReportList.dataList.length+1,
      itemBuilder: (BuildContext context, int index, Animation<double> animation){
        index = index-1;
        return index == -1? FadeIn(
          //for animation
          duration: Duration(milliseconds: 1000),
          //fow showing each value of list
          child: EachRowDesign(
            firstColumnData: "Date",
            secondColumnData: "Vehicles",
            thirdColumnData: "Amount",
            firstColumnFontColor: providerThemeAndColor.secondTextColor,
            secondColumnFontColor: providerThemeAndColor.thirdTextColor,
            thirdColumnFontColor: Colors.red[800],
            fontWeight: FontWeight.bold,
            backgroundColor: providerThemeAndColor.secondColor,
          ),
        ) : SlideInUp(
          //for animation
          duration: Duration(milliseconds: 500),
          //fow showing each value of list
          child: EachRowDesign(
            firstColumnData: previousReportList.dataList[index].date,
            secondColumnData: previousReportList.dataList[index].vehicles,
            thirdColumnData: previousReportList.dataList[index].dailyTotalAmount+" tk",
            firstColumnFontColor: providerThemeAndColor.secondTextColor,
            secondColumnFontColor: providerThemeAndColor.thirdTextColor,
            thirdColumnFontColor: Colors.red,
            fontWeight: FontWeight.bold,
            backgroundColor: providerThemeAndColor.backgroundColor,
          ),
        );
      },
    );
  }
}
