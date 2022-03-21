import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DesignModule/CustomDialog.dart';
import 'package:toll_plaza/DesignModule/eachRowDesign.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousVipPassMohanonda extends StatefulWidget {
  @override
  _PreviousVipPassMohanondaState createState() =>
      _PreviousVipPassMohanondaState();
}

class _PreviousVipPassMohanondaState extends State<PreviousVipPassMohanonda> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    var fetch_data = Provider.of<GetMohanondaData>(context, listen: false);
    fetch_data.get_vippreviosreportmohanonda();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    /*final previousVIPReportList =
        Provider.of<PreviousVIPReportTeestaDataModule>(context);*/
    return Consumer<GetMohanondaData>(builder: (content, data, child) {
      return data.vipPreviousReport != null
          ? AnimatedList(
              key: _listKey,
              initialItemCount: data.vipPreviousReport.data.length + 1,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                index = index - 1;
                return SlideInRight(
                  //for animation
                  duration: Duration(milliseconds: 800),
                  child: index == -1
                      ? EachRowDesign(
                          firstColumnData: "Date",
                          secondColumnData: "Vehicles",
                          firstColumnFontColor:
                              providerThemeAndColor.secondTextColor,
                          secondColumnFontColor: Colors.red,
                          fontWeight: FontWeight.bold,
                          backgroundColor: providerThemeAndColor.thirdColor,
                        )
                      : EachRowDesign(
                          firstColumnData:
                              data.vipPreviousReport.data[index].date,
                          secondColumnData: data
                              .vipPreviousReport.data[index].totalVehicles
                              .toString(),
                          firstColumnFontColor:
                              providerThemeAndColor.secondTextColor,
                          secondColumnFontColor: Colors.red,
                          fontWeight: FontWeight.bold,
                          backgroundColor:
                              providerThemeAndColor.backgroundColor,
                        ),
                );
              },
            )
          : Customdialog();
    });
  }
}
