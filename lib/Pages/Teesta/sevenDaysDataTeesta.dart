import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DesignModule/sevenDaysRowDesign.dart';
import 'package:toll_plaza/Provider/getData.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class sevenDaysDataTeesta extends StatefulWidget {
  @override
  _sevenDaysDataTeestaState createState() => _sevenDaysDataTeestaState();
}

class _sevenDaysDataTeestaState extends State<sevenDaysDataTeesta> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    var fetch_data = Provider.of<GetData>(context, listen: false);
    fetch_data.get_sevenDaysData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Consumer<GetData>(builder: (content, data, child) {
      return data.sevenDaysData != null
          ? AnimatedList(
        key: _listKey,
        initialItemCount: data.sevenDaysData.data.length,
        itemBuilder: (BuildContext context, int index,
            Animation<double> animation) {
          index = index - 1;
          return index == -1
              ? FadeIn(
            //for animation
            duration: Duration(milliseconds: 1000),
            //fow showing each value of list
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: providerThemeAndColor.secondColor,
                child: Text(
                  "Seven Days Data",
                  style: TextStyle(
                      color: providerThemeAndColor.secondTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
              : SlideInUp(
            //for animation
            duration: Duration(milliseconds: 500),
            //fow showing each value of list
            child: sevenDaysrowDesign(
              date: data.sevenDaysData.data[index].date.toString(),
              total_amount: data
                  .sevenDaysData.data[index].total_amount
                  .toString(),
              rickshawvan: data
                  .sevenDaysData.data[index].rickshawvan
                  .toString(),
              motorcycle: data.sevenDaysData.data[index].motorcycle
                  .toString(),
              threefourwheeler: data
                  .sevenDaysData.data[index].threefourwheeler
                  .toString(),
              sedancar: data.sevenDaysData.data[index].sedancar
                  .toString(),
              four_wheeler: data
                  .sevenDaysData.data[index].four_wheeler
                  .toString(),
              microbus: data.sevenDaysData.data[index].microbus
                  .toString(),
              minibus:
              data.sevenDaysData.data[index].minibus.toString(),
              agrouse:
              data.sevenDaysData.data[index].agrouse.toString(),
              minitruck: data.sevenDaysData.data[index].minitruck
                  .toString(),
              bigbus:
              data.sevenDaysData.data[index].bigbus.toString(),
              medium_truck: data
                  .sevenDaysData.data[index].medium_truck
                  .toString(),
              heavy_truck: data
                  .sevenDaysData.data[index].heavy_truck
                  .toString(),
              trailer_long: data
                  .sevenDaysData.data[index].trailer_long
                  .toString(),
              firstColumnFontColor:
              providerThemeAndColor.secondTextColor,
              secondColumnFontColor:
              providerThemeAndColor.thirdTextColor,
              thirdColumnFontColor: Colors.black,
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