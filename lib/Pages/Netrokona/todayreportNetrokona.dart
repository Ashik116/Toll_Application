import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Netrokona/netrokonaTodayDataModule.dart';
import 'package:toll_plaza/DesignModule/eachRowDesign.dart';
import 'package:toll_plaza/DesignModule/vehicleReportViewingDesign.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class TodayReportNetrokona extends StatefulWidget {
  //const TodayReportNetrokona({Key key}) : super(key: key);

  @override
  _TodayReportNetrokonaState createState() => _TodayReportNetrokonaState();
}

class _TodayReportNetrokonaState extends State<TodayReportNetrokona> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final todayData = Provider.of<TodayReportNetrokonaDatabase>(context);
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    bool isDark = providerThemeAndColor.darkTheme;

    return Column(
      children: [
        SizedBox(height: 2,),
        EachRowDesign(
          firstColumnData: "Overloaded\n${todayData.regular.toString()}",
          secondColumnData: "Total\n${todayData.total.toString()}",
          backgroundColor: providerThemeAndColor.barColor,
          firstColumnFontColor: providerThemeAndColor.secondTextColor,
          secondColumnFontColor: providerThemeAndColor.secondTextColor,
          fontWeight: FontWeight.bold,
          dividerColor: Colors.red.shade800,
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
            child: todayData.vehicleDataList.isNotEmpty ? ListView.builder(
                itemCount: todayData.vehicleDataList.length,
                itemBuilder: (context, index) {
                  var vehicle = todayData.vehicleDataList[index];
                  return VehicleReportViewingDesign(
                    vehicleName: vehicle.vehicleName.toString(),
                    vehicleImage: vehicle.image.toString(),
                    secondRowTitle: "Overloaded",
                    regular: (int.parse(vehicle.regular) - int.parse(vehicle.ctrlR)).toString(),
                  );
                }):
            Center(
              child: Text(
                "Data not found",
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            )
        ),
      ],
    );
  }
}
