import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DesignModule/vertical_divider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';
import 'eachRowDesign.dart';

class SevenDaysRowDesign extends StatefulWidget {
  String date;
  String totalAmount;
  String rickshawVan;
  String motorcycle;
  String threeFourWheeler;
  String sedanCar;
  String fourWheeler;
  String microBus;
  String minibus;
  String agrouse;
  String miniTruck;
  String bigBus;
  String mediumTruck;
  String heavyTruck;
  String trailerLong;

  final FontWeight fontWeight;
  final Color firstColumnFontColor;
  final Color secondColumnFontColor;
  final Color thirdColumnFontColor;
  final Color dividedColor;
  final Color backgroundColor;

  SevenDaysRowDesign({
    Key key,
    @required this.date,
    @required this.totalAmount,
    this.rickshawVan,
    this.motorcycle,
    this.threeFourWheeler,
    this.sedanCar,
    this.fourWheeler,
    this.microBus,
    this.minibus,
    this.agrouse,
    this.miniTruck,
    this.bigBus,
    this.mediumTruck,
    this.heavyTruck,
    this.trailerLong,
    this.fontWeight,
    this.firstColumnFontColor,
    this.backgroundColor,
    this.secondColumnFontColor,
    this.thirdColumnFontColor,
    this.dividedColor
  });

  @override
  _SevenDaysRowDesignState createState() => _SevenDaysRowDesignState();
}

class _SevenDaysRowDesignState extends State<SevenDaysRowDesign> {
  String date;
  String totalAmount;
  String rickshawVan;
  String motorcycle;
  String threeFourWheeler;
  String sedanCar;
  String fourWheeler;
  String microBus;
  String miniBus;
  String agrouse;
  String miniTruck;
  String bigBus;
  String mediumTruck;
  String heavyTruck;
  String trailerLong;

  FontWeight _fontWeight;
  Color _firstColumnFontColor;
  Color _secondColumnFontColor;
  Color _thirdColumnFontColor;
  Color _dividedColor;
  Color _backgroundColor;

  void setUp() {
    date = widget.date;
    totalAmount = widget.totalAmount;
    rickshawVan = widget.rickshawVan;
    motorcycle = widget.motorcycle;
    threeFourWheeler = widget.threeFourWheeler;
    sedanCar = widget.sedanCar;
    fourWheeler = widget.fourWheeler;
    fourWheeler = widget.fourWheeler;
    microBus = widget.microBus;
    miniBus = widget.minibus;
    agrouse = widget.agrouse;
    miniTruck = widget.miniTruck;
    bigBus = widget.bigBus;
    mediumTruck = widget.mediumTruck;
    heavyTruck = widget.heavyTruck;
    trailerLong = widget.trailerLong;

    _fontWeight = widget.fontWeight != null ? widget.fontWeight : FontWeight.normal;
    _firstColumnFontColor = widget.firstColumnFontColor != null ? widget.firstColumnFontColor : context.read<ThemeAndColorProvider>().textColor;
    _secondColumnFontColor = widget.secondColumnFontColor != null ? widget.secondColumnFontColor : context.read<ThemeAndColorProvider>().textColor;
    _thirdColumnFontColor = widget.thirdColumnFontColor != null ? widget.thirdColumnFontColor : context.read<ThemeAndColorProvider>().textColor;
    _dividedColor = widget.dividedColor != null ? widget.dividedColor : Colors.red;
    _backgroundColor = widget.backgroundColor != null ? widget.backgroundColor : context.read<ThemeAndColorProvider>().backgroundColor;
  }

  @override
  void initState() {
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
                child: Text(
                    date.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: themeAndColor.thirdTextColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .8
                    )
                ),
                flex: 3,
              ),
              Expanded(
                flex: 8,
                child: Container(
                  color: themeAndColor.sevenDaysCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        //height: 40,
                        width: double.infinity,
                        color: providerThemeAndColor.barHighlighterColor,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Total: ${totalAmount.toString()}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: themeAndColor.secondTextColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .8
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
                      ),
                      Container(
                        width: double.infinity,
                        child: EachRowDesign(
                          firstColumnData: "Class  ",
                          secondColumnData: "Count",
                          thirdColumnData: "Amount",
                          firstColumnFontColor: themeAndColor.secondTextColor,
                          secondColumnFontColor: themeAndColor.secondTextColor,
                          thirdColumnFontColor: themeAndColor.secondTextColor,
                          fontWeight: FontWeight.bold,
                          backgroundColor: providerThemeAndColor.barHighlighterColor,
                          elevation: 0,
                          dividerColor: Colors.red.shade700,
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  rickshawVan.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(rickshawVan) * 5).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  threeFourWheeler.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(threeFourWheeler) * 20).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  sedanCar.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(sedanCar) * 40).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  fourWheeler.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(fourWheeler) * 60).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  microBus.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(microBus) * 80).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  miniBus.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(miniBus) * 80).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  miniTruck.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(miniTruck) * 170).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  bigBus.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(bigBus) * 150).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  mediumTruck.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(mediumTruck) * 200).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  heavyTruck.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(heavyTruck) * 260).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 1,
                        color: themeAndColor.backgroundColor,
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
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  trailerLong.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                            CustomVerticalDivider(
                              dividerColor: Colors.green.shade900,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  (int.parse(trailerLong) * 565).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
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
