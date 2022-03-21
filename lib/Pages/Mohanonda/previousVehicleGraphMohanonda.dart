import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';

class PreviousVehicleGraphMohanonda extends StatefulWidget {
  @override
  _PreviousVehicleGraphMohanondaState createState() =>
      _PreviousVehicleGraphMohanondaState();
}

class _PreviousVehicleGraphMohanondaState
    extends State<PreviousVehicleGraphMohanonda> {
  List<charts.Series<VehicleModel, String>> seriesList;

  bool animate = true;

  _createSampleData() {
    List<VehicleModel> data = [];

    for (var v in context.read<GetMohanondaData>().previousDayModel.data) {
      data.add(VehicleModel(
          day: v.date.substring(8, 10), vehicle: (int.parse(v.totalVehicles.toString()))));
    }
    /*for (var v in context.read<PreviousReportMohanondaDataModule>().dataList) {
      data.add(VehicleModel(
          day: v.date.substring(0, 2), vehicle: (int.parse(v.vehicles))));
    }*/
    seriesList.add(charts.Series(
      data: data,
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (VehicleModel vehicleModel, _) => vehicleModel.day,
      measureFn: (VehicleModel vehicleModel, _) => vehicleModel.vehicle,
      labelAccessorFn: (VehicleModel vehicleModel, _) =>
          vehicleModel.vehicle.toString(),
      id: 'Vehicle',
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    var fetch_data = Provider.of<GetMohanondaData>(context, listen: false);
    fetch_data.get_previosreportmohanonda();
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
