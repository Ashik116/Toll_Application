
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousReportCharsindurDataModule.dart';


class PreviousVehicleGraphCharsindur extends StatefulWidget {

  @override
  _PreviousVehicleGraphCharsindurState createState() => _PreviousVehicleGraphCharsindurState();
}

class _PreviousVehicleGraphCharsindurState extends State<PreviousVehicleGraphCharsindur> {
  List<charts.Series<VehicleModel, String>> seriesList;

  bool animate = true;



  _createSampleData() {


    List<VehicleModel> data = [];

    for(var v in context.read<PreviousReportCharsindurDataModule>().dataList){
      data.add(VehicleModel(day: v.date.substring(0,2), vehicle: (int.parse(v.vehicles))));
    }
    seriesList.add(
      charts.Series(
        data: data,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (VehicleModel vehicleModel, _) => vehicleModel.day,
        measureFn: (VehicleModel vehicleModel, _) => vehicleModel.vehicle,
        labelAccessorFn: (VehicleModel vehicleModel, _) => vehicleModel.vehicle.toString(),
        id: 'Vehicle',
      )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesList = List<charts.Series<VehicleModel, String>>();
    _createSampleData();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: charts.BarChart(
          seriesList,
          animate: animate,
         barRendererDecorator: charts.BarLabelDecorator<String>(),
         domainAxis: new charts.OrdinalAxisSpec(),
        ),
      ),
    );
  }
}


class VehicleModel {
  final String day;
  final int vehicle;

  VehicleModel({this.day, this.vehicle});
}