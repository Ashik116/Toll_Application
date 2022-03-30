import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class VehicleReportViewingDesign extends StatefulWidget {
  final String vehicleName;
  final String vehicleImage;
  final String totalVehicle;
  final String totalPayment;
  final String perVehicleRate;
  final String secondRowTitle;
  final String triadRowTitle;
  final String regular;
  final String ctrlR;

  VehicleReportViewingDesign({
    Key key,
    @required this.vehicleName,
    @required this.vehicleImage,
    this.totalVehicle,
    this.totalPayment,
    this.perVehicleRate,
    this.secondRowTitle,
    this.triadRowTitle,
    this.regular,
    this.ctrlR
  });
  @override
  _VehicleReportViewingDesignState createState() => _VehicleReportViewingDesignState();
}

class _VehicleReportViewingDesignState extends State<VehicleReportViewingDesign> {
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
                          child: Text(
                            widget.vehicleName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: providerThemeAndColor.thirdTextColor,
                                fontSize: 18
                            ),
                          ),
                          flex: 3,
                        ),
                        widget.perVehicleRate == null ? Container() :
                        Expanded(
                          child: Text(
                            widget.perVehicleRate + " tk",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: providerThemeAndColor.secondTextColor,
                                fontSize: 14
                            ),
                          ),
                          flex: 1,
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
                        Expanded(
                            child: Text(
                              widget.totalVehicle != null ? widget.totalVehicle : widget.regular,
                              style: TextStyle(
                                  color: Colors.green,
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
                                  color: providerThemeAndColor.secondTextColor,
                                  fontSize: 16
                              ),
                            )
                        ),
                        Expanded(
                            child: Text(
                              widget.totalPayment != null ? "${widget.totalPayment} tk" : widget.ctrlR,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16
                              ),
                            )
                        )
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
