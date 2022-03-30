import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class ChittagongVehicleReportViewingDesign extends StatefulWidget {
  final String vehicleName;
  final String vehicleImage;
  final String totalVehicle;
  final String totalPayment;
  final String perVehicleRate;
  final String secondRowTitle;
  final String triadRowTitle;
  final String fourthRowTitle;
  final String fourthRowData;
  final String regular;
  final String ctrlR;

  ChittagongVehicleReportViewingDesign({
    Key key,
    @required this.vehicleName,
    @required this.vehicleImage,
    this.totalVehicle,
    this.totalPayment,
    this.perVehicleRate,
    this.secondRowTitle,
    this.triadRowTitle,
    this.regular,
    this.ctrlR,
    this.fourthRowTitle,
    this.fourthRowData
  });

  @override
  _ChittagongVehicleReportViewingDesignState createState() => _ChittagongVehicleReportViewingDesignState();
}

class _ChittagongVehicleReportViewingDesignState extends State<ChittagongVehicleReportViewingDesign> {
  bool large;
  bool medium;

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: providerThemeAndColor.backgroundColor,
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Image(
                  image: AssetImage(widget.vehicleImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            widget.vehicleName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: providerThemeAndColor.thirdTextColor,
                                fontSize: 18
                            ),
                          ),

                        ),
                        widget.perVehicleRate == null ? Container() :
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${widget.perVehicleRate}  tk",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color:
                                providerThemeAndColor.secondTextColor,
                                fontSize: 14
                            ),
                          ),
                        )
                      ],
                    ),
                    widget.secondRowTitle == null ? Container() :
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              widget.secondRowTitle,
                              style: TextStyle(
                                  color: providerThemeAndColor.secondTextColor,
                                  fontSize: 16
                              ),
                            )
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                              widget.totalVehicle != null ? widget.totalVehicle : widget.regular,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16
                              ),
                            )
                        )
                      ],
                    ),
                    widget.triadRowTitle == null ? Container() :
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              widget.triadRowTitle,
                              style: TextStyle(
                                  color:
                                  providerThemeAndColor.secondTextColor,
                                  fontSize: 16
                              ),
                            )
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                              widget.totalPayment != null ? "${widget.totalPayment} tk" : widget.ctrlR,
                              style:
                              TextStyle(color: Colors.green, fontSize: 16),
                            )
                        )
                      ],
                    ),
                    // change line
                    widget.fourthRowTitle == null ? Container() :
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              widget.fourthRowTitle,
                              style: TextStyle(
                                  color: providerThemeAndColor.secondTextColor,
                                  fontSize: 16
                              ),
                            )
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                              widget.totalPayment != null ? "${widget.totalPayment} tk" : widget.fourthRowData,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}