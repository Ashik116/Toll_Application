import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DesignModule/sevenDaysVipRowDesign.dart';
import 'package:toll_plaza/Provider/getData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousVipClassTeesta extends StatefulWidget {
  @override
  _PreviousVipClassTeestaState createState() => _PreviousVipClassTeestaState();
}

class _PreviousVipClassTeestaState extends State<PreviousVipClassTeesta> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  bool isLoading = true;

  @override
  void initState() {
    var fetchData = Provider.of<GetData>(context, listen: false);
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
    Consumer<GetData>(builder: (content, data, child) {
      return data.sevenDaysVipPass != null ?
      AnimatedList(
        key: _listKey,
        initialItemCount: data.sevenDaysVipPass.data.length,
        itemBuilder: (BuildContext context, int index, Animation<double> animation) {
          index = index - 1;
          return index == -1 ?
          FadeIn(
            //for animation
            duration: Duration(milliseconds: 150),
            //fow showing each value of list
            child: Padding(
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
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
          )
              : SlideInUp(
            //for animation
            duration: Duration(milliseconds: 150),
            //fow showing each value of list
            child: sevenDaysVipRowDesign(
              date: data.sevenDaysVipPass.data[index].date.toString(),
              totalAmount: data.sevenDaysVipPass.data[index].total_amount.toString(),
              rickshawVan: data.sevenDaysVipPass.data[index].rickshawvan.toString(),
              motorcycle: data.sevenDaysVipPass.data[index].motorcycle.toString(),
              threeFourWheeler: data.sevenDaysVipPass.data[index].threefourwheeler.toString(),
              sedanCar: data.sevenDaysVipPass.data[index].sedancar.toString(),
              fourWheeler: data.sevenDaysVipPass.data[index].four_wheeler.toString(),
              microBus: data.sevenDaysVipPass.data[index].microbus.toString(),
              minibus: data.sevenDaysVipPass.data[index].minibus.toString(),
              agrouse: data.sevenDaysVipPass.data[index].agrouse.toString(),
              miniTruck: data.sevenDaysVipPass.data[index].minitruck.toString(),
              bigBus: data.sevenDaysVipPass.data[index].bigbus.toString(),
              mediumTruck: data.sevenDaysVipPass.data[index].medium_truck.toString(),
              heavyTruck: data.sevenDaysVipPass.data[index].heavy_truck.toString(),
              trailerLong: data.sevenDaysVipPass.data[index].trailer_long.toString(),
              firstColumnFontColor: providerThemeAndColor.secondTextColor,
              secondColumnFontColor: providerThemeAndColor.thirdTextColor,
              thirdColumnFontColor: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ) : Container();
    }
    );
  }
}