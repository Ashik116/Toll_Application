import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DesignModule/eachRowDesign.dart';
import 'package:toll_plaza/Provider/getData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousReportTeesta extends StatefulWidget {
  @override
  _PreviousReportTeestaState createState() => _PreviousReportTeestaState();
}

class _PreviousReportTeestaState extends State<PreviousReportTeesta> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    var fetch_data = Provider.of<GetData>(context, listen: false);
    fetch_data.get_previosreportteesta();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Consumer<GetData>(builder: (content, data, child) {
      return data.previousDayModel != null
          ? AnimatedList(
              key: _listKey,
              initialItemCount: data.previousDayModel.data.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                index = index - 1;
                return index == -1
                    ? FadeIn(
                        //for animation
                        duration: Duration(milliseconds: 1000),
                        //fow showing each value of list
                        child: EachRowDesign(
                          firstColumnData: "Date",
                          secondColumnData: "Vehicles",
                          thirdColumnData: "Amount",
                          firstColumnFontColor:
                              providerThemeAndColor.secondTextColor,
                          secondColumnFontColor:
                              providerThemeAndColor.thirdTextColor,
                          thirdColumnFontColor: Colors.red[800],
                          fontWeight: FontWeight.bold,
                          backgroundColor: providerThemeAndColor.secondColor,
                        ),
                      )
                    : SlideInUp(
                        //for animation
                        duration: Duration(milliseconds: 500),
                        //fow showing each value of list
                        child: EachRowDesign(
                          firstColumnData:
                              data.previousDayModel.data[index].date.toString(),
                          secondColumnData: data
                              .previousDayModel.data[index].totalVehicles
                              .toString(),
                          thirdColumnData: data
                                  .previousDayModel.data[index].amount
                                  .toString() +
                              " tk",
                          firstColumnFontColor:
                              providerThemeAndColor.secondTextColor,
                          secondColumnFontColor:
                              providerThemeAndColor.thirdTextColor,
                          thirdColumnFontColor: Colors.red,
                          fontWeight: FontWeight.bold,
                          backgroundColor:
                              providerThemeAndColor.backgroundColor,
                        ),
                      );
              },
            )
          : Container();
    });
  }
}
