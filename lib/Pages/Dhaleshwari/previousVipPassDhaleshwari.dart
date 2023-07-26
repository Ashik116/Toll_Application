import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DesignModule/sevenDaysVipRowDesign.dart';
import 'package:toll_plaza/DesignModule/sevendayRowDesignDhaleshwari.dart';
import 'package:toll_plaza/Provider/getDhaleshwariData.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousVipClassDhaleshwari extends StatefulWidget {
  @override
  _PreviousVipClassDhaleshwariState createState() => _PreviousVipClassDhaleshwariState();
}

class _PreviousVipClassDhaleshwariState extends State<PreviousVipClassDhaleshwari> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  bool isLoading = true;

  @override
  void initState() {
    var fetchData = Provider.of<GetDhaleshwariData>(context, listen: false);
    fetchData.get_sevenDaysVipPass().then((value) {
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
    return isLoading ? loadingAnimation() :
    Consumer<GetDhaleshwariData>(builder: (content, data, child) {
      return data.sevenDaysVipPass != null ?
      AnimatedList(
        key: _listKey,
        initialItemCount: data.sevenDaysVipPass.data.length,
        itemBuilder: (BuildContext context, int index,
            Animation<double> animation) {
          index = index - 1;
          return index == -1 ?
          FadeIn(
            //for animation
            duration: Duration(milliseconds: 1000),
            //fow showing each value of list
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: providerThemeAndColor.barColor,
                child: Text(
                  "Seven Days VIP Pass Data",
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
            duration: Duration(milliseconds: 500),
            //fow showing each value of list
            child: SevenDaysRowDesignDhaleshwari(
              date: data.sevenDaysVipPass.data[index].date.toString(),
              totalAmount: data.sevenDaysVipPass.data[index].total_amount.toString(),

              motorcycle: data.sevenDaysVipPass.data[index].motorcycle.toString(),

              sedanCar: data.sevenDaysVipPass.data[index].sedancar.toString(),
              fourWheeler: data.sevenDaysVipPass.data[index].four_wheeler.toString(),
              microBus: data.sevenDaysVipPass.data[index].microbus.toString(),
              minibus: data.sevenDaysVipPass.data[index].minibus.toString(),

              miniTruck: data.sevenDaysVipPass.data[index].minitruck.toString(),
              bigBus: data.sevenDaysVipPass.data[index].bigbus.toString(),
              mediumTruck: data.sevenDaysVipPass.data[index].medium_truck.toString(),
              heavyTruck: data.sevenDaysVipPass.data[index].heavy_truck.toString(),
              trailerLong: data.sevenDaysVipPass.data[index].trailer_long.toString(),
              firstColumnFontColor: providerThemeAndColor.secondTextColor,
              secondColumnFontColor: providerThemeAndColor.thirdTextColor,
              thirdColumnFontColor: Colors.black,
              fontWeight: FontWeight.bold,
              backgroundColor: providerThemeAndColor.backgroundColor,
            ),
          );
        },
      ) : Container();
    });
  }
}