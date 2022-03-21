import 'dart:async';

import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DesignModule/searchReportview.dart';
import 'package:toll_plaza/Provider/getData.dart';

class ReportSearch extends StatefulWidget {
  @override
  _ReportSearchState createState() => _ReportSearchState();
}

class _ReportSearchState extends State<ReportSearch> {
  double _height, _width;
  double _pixelRatio;
  bool large;
  bool medium;
  String Select;
  int rate = 0;
  bool regular = false;
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

  final List discountList = [
    {
      'discount': '14',
      'discountName': 'Foodis Friday',
      'velidity': '20th july 2020',
      'code': 'FooDy2020',
      'bannerImage': 'Assets/RestaurantDetails/RestaurantApp.jpg'
    },
    {
      'discount': '18',
      'discountName': 'July Special',
      'velidity': '18th july 2020',
      'code': 'July2020',
      'bannerImage': 'assets/banner.jpg'
    },
    {
      'discount': '20',
      'discountName': 'Birthday Offer',
      'velidity': '22th july 2020',
      'code': 'HDOffer',
      'bannerImage': 'assets/logo.png'
    },
    {
      'discount': '25',
      'discountName': 'Junmasti Special',
      'velidity': '25th july 2020',
      'code': 'KANHA2020',
      'bannerImage': 'assets/rocket.jpg'
    },
  ];

  Timer timer;

  DateTime start_time = DateTime.now();
  DateTime end_time = DateTime.now().add(Duration(days: 7));

  Future displayDatePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: start_time,
        initialLastDate: end_time,
        firstDate: new DateTime(DateTime.now().year - 50),
        lastDate: new DateTime(DateTime.now().year + 50));

    try {
      if (picked != null && picked.length == 2) {
        setState(() {
          start_time = picked[0];
          end_time = picked[1];
          /*GO();*/
        });
      } else {
        /*Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushNamed(HOME);
      });*/
        Flushbar(
            flushbarPosition: FlushbarPosition.BOTTOM,
            isDismissible: false,
            duration: Duration(seconds: 3),
            titleText: Text(
              "Hey ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.yellow[600]),
            ),
            messageText: Text(
              "Please select Your Valid Date Range",
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            ))
          ..show(context);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Search Report")),
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
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Container(
              width: _width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // [Monday] checkbox
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: regular,
                        onChanged: (bool value) {
                          setState(() {
                            regular = value;
                            vip = false;
                            choose = 'regular';
                          });
                        },
                      ),
                      Text("Regular"),
                    ],
                  ),
                  // [Tuesday] checkbox
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: vip,
                        onChanged: (bool value) {
                          setState(() {
                            vip = value;
                            regular = false;
                            choose = 'vip';
                          });
                        },
                      ),
                      Text("Vip Pass"),
                    ],
                  ),
                  // [Wednesday] checkbox
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: DropdownButton(
                      isExpanded: true,
                      underline: Container(),
                      hint:
                          Text('Select Vehicle'), // Not necessary for Option 1
                      value: Select,
                      onChanged: (newValue) {
                        setState(() {
                          Select = newValue;
                          RateCalculation();
                          var fetch_data =
                              Provider.of<GetData>(context, listen: false);
                          fetch_data.search_report(
                              DateFormat('yyyy-MM-dd')
                                  .format(start_time)
                                  .toString(),
                              DateFormat('yyyy-MM-dd')
                                  .format(end_time)
                                  .toString(),
                              Select,
                              choose);

                          print(Select);
                        });
                      },
                      items: vehicleList.map((e) {
                        return DropdownMenuItem(
                          child: new Text(
                            e,
                            style: TextStyle(color: Colors.black),
                          ),
                          value: e,
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Card(
                            child: Container(
                                child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(Icons.calendar_today),
                                    onPressed: () {
                                      displayDatePicker(context);
                                    }),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    "${DateFormat('yyyy-MM-dd').format(start_time).toString()} to ${DateFormat('yyyy-MM-dd').format(end_time).toString()}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                )
                              ],
                            )),
                          ),
                          Expanded(
                            child: Card(
                              color: Colors.green,
                              child: InkWell(
                                  onTap: () {
                                    var fetch_data = Provider.of<GetData>(
                                        context,
                                        listen: false);
                                    fetch_data.search_report(
                                        DateFormat('yyyy-MM-dd')
                                            .format(start_time)
                                            .toString(),
                                        DateFormat('yyyy-MM-dd')
                                            .format(end_time)
                                            .toString(),
                                        Select,
                                        choose);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.search,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                      ))),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Expanded(child: Consumer<GetData>(
              builder: (content, data, child) {
                return data.searchModel != null
                    ? Container(
                        width: _width,
                        child: ListView.builder(
                            itemCount: data.searchModel.data.length,
                            itemBuilder: (context, index) {
                              return SearchReportView(
                                  vehicleName: Select == 'Agro Use'
                                      ? 'Agro Use'
                                      : Select == 'Rickshaw Van'
                                          ? 'Rickshaw Van'
                                          : Select == 'Sedan Car'
                                              ? 'Sedan Car'
                                              : Select == '4 Wheeler'
                                                  ? '4 Wheeler'
                                                  : Select == 'Micro Bus'
                                                      ? 'Micro Bus'
                                                      : Select == 'Motor Cycle'
                                                          ? 'Motor Cycle'
                                                          : Select ==
                                                                  'Trailer Long'
                                                              ? 'Trailer Long'
                                                              : Select ==
                                                                      'Heavy Truck'
                                                                  ? 'Heavy Truck'
                                                                  : Select ==
                                                                          'Medium Truck'
                                                                      ? 'Medium Truck'
                                                                      : Select ==
                                                                              'Big Bus'
                                                                          ? 'Big Bus'
                                                                          : Select ==
                                                                                  'Mini Truck'
                                                                              ? 'Mini Truck'
                                                                              : Select ==
                                                                                      '3/4 Wheeler'
                                                                                  ? '3/4 Wheeler'
                                                                                  : "Mini Bus",
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          "/photoView",
                                          arguments: data
                                              .searchModel.data[index].imagase);
                                    },
                                    child: Image(
                                      image: NetworkImage(
                                          "http://103.150.65.66/image/" +
                                              data.searchModel.data[index]
                                                  .imagase),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  secondRowTitle: "Lane No",
                                  totalVehicle: data.searchModel.data[index].lan
                                      .toString(),
                                  perVehicleRate: rate.toString(),
                                  triadRowTitle: "Toll Rate",
                                  date: data.searchModel.data[index].dateTime
                                      .toString(),
                                  totalPayment: data
                                      .searchModel.data[index].amount
                                      .toString());
                            }),
                      )
                    : Container();
              },
            ))
          ],
        ),
      ),
    ));
  }

  RateCalculation() {
    Select == 'Agro Use'
        ? rate = 135
        : Select == 'Rickshaw Van'
            ? rate = 5
            : Select == 'Sedan Car'
                ? rate = 40
                : Select == '4 Wheeler'
                    ? rate = 60
                    : Select == 'Micro Bus'
                        ? rate = 80
                        : Select == 'Motor Cycle'
                            ? rate = 10
                            : Select == 'Trailer Long'
                                ? rate = 565
                                : Select == 'Heavy Truck'
                                    ? rate = 260
                                    : Select == 'Medium Truck'
                                        ? rate = 200
                                        : Select == 'Big Bus'
                                            ? rate = 150
                                            : Select == 'Mini Truck'
                                                ? rate = 170
                                                : Select == '3/4 Wheeler'
                                                    ? rate = 20
                                                    : rate = 80;
  }
}
