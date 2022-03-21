import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Manikganj/manikganjTodyDataModule.dart';
import 'package:toll_plaza/DesignModule/eachRowDesign.dart';
import 'package:toll_plaza/DesignModule/vehicleReportViewingDesign.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
 
class TodayReportManikganj extends StatefulWidget {
  @override
  _TodayReportManikganjState createState() => _TodayReportManikganjState();
}

class _TodayReportManikganjState extends State<TodayReportManikganj> {

  void initState()  {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    final todayData = Provider.of<TodayReportManikganjDatabase>(context);

    return Column(children: [
      SizedBox(
        height: 2,
      ),
      EachRowDesign(
        /*
        firstColumnData: "Regular:\n" + todayData.regular.toString(),
        secondColumnData: "Ctrl+R:\n" + todayData.ctrlR.toString(),
        thirdColumnData: "Total:\n" + todayData.total.toString(),
        backgroundColor: providerThemeAndColor.secondColor,
        firstColumnFontColor: providerThemeAndColor.secondTextColor,
        secondColumnFontColor: Colors.red[700],
        thirdColumnFontColor: providerThemeAndColor.secondTextColor,
        */
        firstColumnData: "Overloaded:\n" + todayData.regular.toString(),
        secondColumnData: "Total:\n" + todayData.total.toString(),
        backgroundColor: providerThemeAndColor.secondColor,
        firstColumnFontColor: providerThemeAndColor.secondTextColor,
        secondColumnFontColor: providerThemeAndColor.secondTextColor,
        fontWeight: FontWeight.bold,
      ),
      SizedBox(
        height: 5,
      ),
      Expanded(
        child: todayData.vehicleDataList.isNotEmpty?ListView.builder(
            itemCount: todayData.vehicleDataList.length,
            itemBuilder: (context, index) {
              var vehicle = todayData.vehicleDataList[index];
              return VehicleReportViewingDesign(
                vehicleName: vehicle.vehicleName.toString(),
                vehicleImage: vehicle.image.toString(),
                secondRowTitle: "Overloaded",
                regular: (int.parse(vehicle.regular)-int.parse(vehicle.ctrlR)).toString(),
                //triadRowTitle: "Ctrl+R",
                //ctrlR: vehicle.ctrlR,
              );
            }): Center(
          child: Card(
            child: Text("Data not found"),
          ),
        )
      ),
    ]);
  }
}
