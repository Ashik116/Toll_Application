import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

import 'eachRowDesign.dart';

class sevenDaysrowDesign extends StatefulWidget {
  String date;
  String total_amount;
  String rickshawvan;
  String motorcycle;
  String threefourwheeler;
  String sedancar;
  String four_wheeler;
  String microbus;
  String minibus;
  String agrouse;
  String minitruck;
  String bigbus;
  String medium_truck;
  String heavy_truck;
  String trailer_long;

  final FontWeight fontWeight;
  final Color firstColumnFontColor;
  final Color secondColumnFontColor;
  final Color thirdColumnFontColor;
  final Color dividedColor;
  final Color backgroundColor;

  sevenDaysrowDesign(
      {Key key,
        @required this.date,
        @required this.total_amount,
        this.rickshawvan,
        this.motorcycle,
        this.threefourwheeler,
        this.sedancar,
        this.four_wheeler,
        this.microbus,
        this.minibus,
        this.agrouse,
        this.minitruck,
        this.bigbus,
        this.medium_truck,
        this.heavy_truck,
        this.trailer_long,
        this.fontWeight,
        this.firstColumnFontColor,
        this.backgroundColor,
        this.secondColumnFontColor,
        this.thirdColumnFontColor,
        this.dividedColor});
  @override
  _sevenDaysrowDesignState createState() => _sevenDaysrowDesignState();
}

class _sevenDaysrowDesignState extends State<sevenDaysrowDesign> {
  String date;
  String total_amount;
  String rickshawvan;
  String motorcycle;
  String threefourwheeler;
  String sedancar;
  String four_wheeler;
  String microbus;
  String minibus;
  String agrouse;
  String minitruck;
  String bigbus;
  String medium_truck;
  String heavy_truck;
  String trailer_long;

  FontWeight _fontWeight;
  Color _firstColumnFontColor;
  Color _secondColumnFontColor;
  Color _thirdColumnFontColor;
  Color _dividedColor;
  Color _backgroundColor;

  void setUp() {
    date = widget.date;
    total_amount = widget.total_amount;
    rickshawvan = widget.rickshawvan;
    motorcycle = widget.motorcycle;
    threefourwheeler = widget.threefourwheeler;
    sedancar = widget.sedancar;
    four_wheeler = widget.four_wheeler;
    four_wheeler = widget.four_wheeler;
    microbus = widget.microbus;
    minibus = widget.minibus;
    agrouse = widget.agrouse;
    minitruck = widget.minitruck;
    bigbus = widget.bigbus;
    medium_truck = widget.medium_truck;
    heavy_truck = widget.heavy_truck;
    trailer_long = widget.trailer_long;

    _fontWeight =
    widget.fontWeight != null ? widget.fontWeight : FontWeight.normal;
    _firstColumnFontColor = widget.firstColumnFontColor != null
        ? widget.firstColumnFontColor
        : context.read<ThemeAndColorProvider>().textColor;
    _secondColumnFontColor = widget.secondColumnFontColor != null
        ? widget.secondColumnFontColor
        : context.read<ThemeAndColorProvider>().textColor;
    _thirdColumnFontColor = widget.thirdColumnFontColor != null
        ? widget.thirdColumnFontColor
        : context.read<ThemeAndColorProvider>().textColor;
    _dividedColor =
    widget.dividedColor != null ? widget.dividedColor : Colors.red;
    _backgroundColor = widget.backgroundColor != null
        ? widget.backgroundColor
        : context.read<ThemeAndColorProvider>().backgroundColor;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    final themeAndColor = Provider.of<ThemeAndColorProvider>(context);
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);

    return Card(
      elevation: 20,
      color: themeAndColor.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(date.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: themeAndColor.thirdTextColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .8)),
                flex: 3,
              ),
              Expanded(
                flex: 8,
                child: Card(
                  color: themeAndColor.secondColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Total: " + total_amount.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: themeAndColor.secondTextColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .8),
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: EachRowDesign(
                          firstColumnData: "Class  ",
                          secondColumnData: "Count",
                          thirdColumnData: "Amount",
                          firstColumnFontColor:
                          providerThemeAndColor.secondTextColor,
                          secondColumnFontColor:
                          providerThemeAndColor.thirdTextColor,
                          thirdColumnFontColor: Colors.black,
                          fontWeight: FontWeight.bold,
                          backgroundColor: providerThemeAndColor.secondColor,
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Rickshaw Van",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  rickshawvan.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(rickshawvan) * 5).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Motor Cycle",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  motorcycle.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(motorcycle) * 10).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "3/4 Wheeler",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  threefourwheeler.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )
                            ),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(threefourwheeler) * 20).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Sedan Car",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  sedancar.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(sedancar) * 40).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Four Wheeler",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  four_wheeler.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(four_wheeler) * 60).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Micro Bus",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  microbus.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(microbus) * 80).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Minibus",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  minibus.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(minibus) * 80).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Agro Use",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  agrouse.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(agrouse) * 135).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Mini Truck",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  minitruck.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(minitruck) * 170).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Big Bus",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  bigbus.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(bigbus) * 150).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Medium Truck",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  medium_truck.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(medium_truck) * 200).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Heavy Truck",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  heavy_truck.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(heavy_truck) * 260).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5,
                        width: double.infinity,
                        child: Container(
                          color: themeAndColor.backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Trailer Long",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8),
                                )),
                            //Expanded(child: Text("|",style: TextStyle(color: themeAndColor.backgroundColor),textAlign: TextAlign.center,)),
                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  trailer_long.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),

                            SizedBox(
                              width: 1.5,
                              height: 30,
                              child: Container(
                                color: themeAndColor.backgroundColor,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(trailer_long) * 565).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}