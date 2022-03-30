import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DesignModule/sevenDaysRowDesignMohanonda.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class sevenDaysDataMohanonda extends StatefulWidget {
  @override
  _sevenDaysDataMohanondaState createState() => _sevenDaysDataMohanondaState();
}

class _sevenDaysDataMohanondaState extends State<sevenDaysDataMohanonda> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  bool isLoading = true;

  @override
  void initState() {
    var fetchData = Provider.of<GetMohanondaData>(context, listen: false);
    fetchData.get_sevenDaysDataMohanonda().then((value) {
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return isLoading ? loadingAnimation() :
    Consumer<GetMohanondaData>(builder: (content, data, child) {
      return data.sevenDaysData != null ?
      AnimatedList(
        key: _listKey,
        initialItemCount: data.sevenDaysData.data.length,
        itemBuilder: (BuildContext context, int index,
            Animation<double> animation) {
          index = index - 1;
          return index == -1 ?
          FadeIn(
            //for animation
            duration: Duration(milliseconds: 150),
            //fow showing each value of list
            child: Padding(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: providerThemeAndColor.barColor,
                child: Text(
                  "Seven Days Data",
                  style: TextStyle(
                      color: providerThemeAndColor.secondTextColor,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ) :
          SlideInUp(
            //for animation
            duration: Duration(milliseconds: 200),
            //fow showing each value of list
            child: SevenDaysRowDesignMohanonda(
              date: data.sevenDaysData.data[index].date.toString(),
              totalAmount: data.sevenDaysData.data[index].total_amount.toString(),
              rickshawVan: data.sevenDaysData.data[index].rickshawvan.toString(),
              motorcycle: data.sevenDaysData.data[index].motorcycle.toString(),
              threeFourWheeler: data.sevenDaysData.data[index].threefourwheeler.toString(),
              sedanCar: data.sevenDaysData.data[index].sedancar.toString(),
              fourWheeler: data.sevenDaysData.data[index].four_wheeler.toString(),
              microBus: data.sevenDaysData.data[index].microbus.toString(),
              minibus: data.sevenDaysData.data[index].minibus.toString(),
              agrouse: data.sevenDaysData.data[index].agrouse.toString(),
              miniTruck: data.sevenDaysData.data[index].minitruck.toString(),
              bigBus: data.sevenDaysData.data[index].bigbus.toString(),
              mediumTruck: data.sevenDaysData.data[index].medium_truck.toString(),
              heavyTruck: data.sevenDaysData.data[index].heavy_truck.toString(),
              trailerLong: data.sevenDaysData.data[index].trailer_long.toString(),
              fontWeight: FontWeight.bold,
              backgroundColor: providerThemeAndColor.backgroundColor,
            ),
          );
        },
      ) : Container();
    });
  }
}