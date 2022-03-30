import 'dart:async';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DesignModule/searchReportview.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class MohanondaReportSearch extends StatefulWidget {
  @override
  _MohanondaReportSearchState createState() => _MohanondaReportSearchState();
}

class _MohanondaReportSearchState extends State<MohanondaReportSearch> {
  double _height, _width;
  bool large;
  bool medium;
  String select;
  int rate = 0;
  bool regular = true;
  bool vip = false;
  String choose = 'regular';

  final List vehicleList = [
    "Rickshaw Van",
    "3/4 Wheeler",
    "Sedan Car",
    "4 Wheeler",
    "Micro Bus",
    "Motor Cycle",
    "Trailer Long",
    "Heavy Truck",
    "Medium Truck",
    "Big Bus",
    "Mini Truck",
    "Agro Use",
    "Mini Bus",
  ];

  Timer timer;

  DateTime startTime = DateTime.now().subtract(Duration(days: 7));
  DateTime endTime = DateTime.now();

  Future displayDatePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: startTime,
        initialLastDate: endTime,
        firstDate: new DateTime(DateTime.now().year - 50),
        lastDate: new DateTime(DateTime.now().year + 50));

    try {
      if (picked != null && picked.length == 2) {
        setState(() {
          startTime = picked[0];
          endTime = picked[1];
          /*GO();*/
        });
      } else {
        /*Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushNamed(HOME);
      });*/
        final snackBar = SnackBar(
          content: Text(
            'Please select a valid date range',
            style: TextStyle(color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
          elevation: 5,
          backgroundColor: Colors.black87,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    bool isDark = providerThemeAndColor.darkTheme;
    return SafeArea(
        child: Scaffold(
          backgroundColor: providerThemeAndColor.backgroundColor,
          appBar: AppBar(
            title: Text(
              "Mohanonda Report Search",
              style: TextStyle(
                color: providerThemeAndColor.textColor,
              ),
            ),
            backgroundColor: providerThemeAndColor.mainColor,
            iconTheme: IconThemeData(color: providerThemeAndColor.iconColor),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: providerThemeAndColor.appBarColor,
                ),
              ),
            ),
          ),
          body: Container(
            height: _height,
            width: _width,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: _width,
                  child: Text(
                    "Pass Category",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: providerThemeAndColor.secondTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                    ),
                  ),
                ),
                Container(
                  width: _width,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: providerThemeAndColor.secondTextColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // [Monday] checkbox
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                              activeColor: providerThemeAndColor.highlighterTextColor,
                              checkColor: providerThemeAndColor.backgroundColor,
                              value: regular,
                              onChanged: (bool value) {
                                setState(() {
                                  regular = value;
                                  vip = false;
                                  choose = 'regular';
                                });
                              },
                            ),
                            Text(
                              "Regular",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: providerThemeAndColor.secondTextColor,
                              ),
                            ),
                          ],
                        ),
                        // [Tuesday] checkbox
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                              activeColor: providerThemeAndColor.highlighterTextColor,
                              checkColor: providerThemeAndColor.backgroundColor,
                              value: vip,
                              onChanged: (bool value) {
                                setState(() {
                                  vip = value;
                                  regular = false;
                                  choose = 'vip';
                                });
                              },
                            ),
                            Text(
                              "Vip Pass",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: providerThemeAndColor.secondTextColor,
                              ),
                            ),
                          ],
                        ),
                        // [Wednesday] checkbox
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: providerThemeAndColor.sevenDaysCardColor,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: DropdownButton(
                          //isExpanded: true,
                          elevation: 15,
                          menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                          dropdownColor: providerThemeAndColor.backgroundColor,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: providerThemeAndColor.secondTextColor,
                              fontSize: 16
                          ),
                          underline: Container(
                            color: isDark ? Colors.green.shade900 : Colors.lightGreen,
                            height: 2,
                          ),
                          hint: Text(
                            'Select Vehicle',
                            style: TextStyle(
                              color: providerThemeAndColor.secondTextColor,
                            ),
                          ), // Not necessary for Option 1
                          value: select,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: isDark ? Colors.green.shade900 : Colors.lightGreen,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              select = newValue;
                              rateCalculation();
                              var fetchData = Provider.of<GetMohanondaData>(context, listen: false);
                              fetchData.search_report(
                                  DateFormat('yyyy-MM-dd')
                                      .format(startTime)
                                      .toString(),
                                  DateFormat('yyyy-MM-dd')
                                      .format(endTime)
                                      .toString(),
                                  select, choose);
                            });
                          },
                          items: vehicleList.map((item) {
                            return DropdownMenuItem(
                              child: new Text(
                                item,
                                style: TextStyle(color: providerThemeAndColor.secondTextColor),
                              ),
                              value: item,
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  displayDatePicker(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: providerThemeAndColor.sevenDaysCardColor,
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: providerThemeAndColor.secondTextColor,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: Text(
                                              "${DateFormat('yyyy-MM-dd').format(startTime).toString()} to ${DateFormat('yyyy-MM-dd').format(endTime).toString()}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: providerThemeAndColor.secondTextColor),
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                child: Icon(
                                  Icons.search,
                                  color: providerThemeAndColor.secondTextColor,
                                  size: 30,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: providerThemeAndColor.barColor,
                                  padding: EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                ),
                                //color: Colors.lightGreen.shade400,
                                onPressed: () {
                                  var fetchData = Provider.of<GetMohanondaData>(context, listen: false);
                                  fetchData.search_report(
                                      DateFormat('yyyy-MM-dd')
                                          .format(startTime)
                                          .toString(),
                                      DateFormat('yyyy-MM-dd')
                                          .format(endTime)
                                          .toString(),
                                      select,
                                      choose);},
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Expanded(child: Consumer<GetMohanondaData>(
                  builder: (content, data, child) {
                    return data.searchModel != null ?
                    Container(
                      width: _width,
                      child: ListView.builder(
                          itemCount: data.searchModel.data.length,
                          itemBuilder: (context, index) {
                            return SearchReportView(
                                vehicleName: select == 'Agro Use'
                                    ? 'Agro Use' : select == 'Rickshaw Van'
                                    ? 'Rickshaw Van' : select == 'Sedan Car'
                                    ? 'Sedan Car' : select == '4 Wheeler'
                                    ? '4 Wheeler' : select == 'Micro Bus'
                                    ? 'Micro Bus' : select == 'Motor Cycle'
                                    ? 'Motor Cycle' : select == 'Trailer Long'
                                    ? 'Trailer Long' : select == 'Heavy Truck'
                                    ? 'Heavy Truck' : select == 'Medium Truck'
                                    ? 'Medium Truck' : select == 'Big Bus'
                                    ? 'Big Bus' : select == 'Mini Truck'
                                    ? 'Mini Truck' : select == '3/4 Wheeler'
                                    ? '3/4 Wheeler' : "Mini Bus",
                                child: InkWell(
                                  // onTap: () {
                                  //   Navigator.of(context).pushNamed(
                                  //       "/photoView",
                                  //       arguments: data.searchModel.data[index].imagase);},
                                  child: Image(
                                    image: NetworkImage("http://103.145.118.20/image/${data.searchModel.data[index].imagase}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                secondRowTitle: "Lane No.",
                                totalVehicle: data.searchModel.data[index].lan.toString(),
                                perVehicleRate: rate.toString(),
                                thirdRowTitle: "Toll Rate",
                                date: data.searchModel.data[index].dateTime.toString(),
                                totalPayment: data.searchModel.data[index].amount.toString()
                            );
                          }),
                    ) :
                    Container();},
                )
                )
              ],
            ),
          ),
        )
    );
  }

  rateCalculation() {
    select == 'Agro Use' ? rate = 60 :
    select == 'Rickshaw Van' ? rate = 5 :
    select == 'Sedan Car' ? rate = 20 :
    select == '4 Wheeler' ? rate = 40 :
    select == 'Micro Bus' ? rate = 40 :
    select == 'Motor Cycle' ? rate = 5 :
    select == 'Trailer Long' ? rate = 375 :
    select == 'Heavy Truck' ? rate = 130 :
    select == 'Medium Truck' ? rate = 90 :
    select == 'Big Bus' ? rate = 50 :
    select == 'Mini Truck' ? rate = 75 :
    select == '3/4 Wheeler' ? rate = 10 : rate = 30;
  }
}
