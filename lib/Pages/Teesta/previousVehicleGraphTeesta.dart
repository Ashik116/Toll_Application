import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Teesta/previousReportTeestaDataModule.dart';

class PreviousVehicleGraphTeesta extends StatefulWidget {
  @override
  _PreviousVehicleGraphTeestaState createState() => _PreviousVehicleGraphTeestaState();
}

class _PreviousVehicleGraphTeestaState extends State<PreviousVehicleGraphTeesta> {
  List<charts.Series<VehicleModel, String>> seriesList;

  bool animate = true;
  String pointerValue;

  _createSampleData() {
    List<VehicleModel> data = [];

    for (var v in context.read<PreviousReportTeestaDataModule>().dataList2) {
      data.add(VehicleModel(
          day: v.date.substring(8, 10), vehicle: (int.parse(v.vehicles)))); //day: v.date.substring(0, 2), vehicle: (int.parse(v.vehicles))));
    }
    seriesList.add(charts.Series(
      data: data,
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (VehicleModel vehicleModel, _) => vehicleModel.day,
      measureFn: (VehicleModel vehicleModel, _) => vehicleModel.vehicle,
      labelAccessorFn: (VehicleModel vehicleModel, _) => vehicleModel.vehicle.toString(),
      id: 'Vehicle',
    ));
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    seriesList = <charts.Series<VehicleModel, String>>[];
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
          primaryMeasureAxis: new charts.NumericAxisSpec(
              tickProviderSpec: new charts.BasicNumericTickProviderSpec(desiredTickCount: 10)
          ),
          barRendererDecorator: charts.BarLabelDecorator<String>(
            labelPosition: charts.BarLabelPosition.inside,
          ),
          domainAxis: charts.OrdinalAxisSpec(),
          behaviors: [
            charts.ChartTitle(pointerValue,
                titleStyleSpec: charts.TextStyleSpec(
                    color: charts.MaterialPalette.green.shadeDefault),
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
          ],
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
