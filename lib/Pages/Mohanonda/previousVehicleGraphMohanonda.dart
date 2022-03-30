import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';

class PreviousVehicleGraphMohanonda extends StatefulWidget {
  @override
  _PreviousVehicleGraphMohanondaState createState() => _PreviousVehicleGraphMohanondaState();
}

class _PreviousVehicleGraphMohanondaState
    extends State<PreviousVehicleGraphMohanonda> {
  List<charts.Series<VehicleModel, String>> seriesList;

  bool animate = true;
  String pointerValue;
  bool isLoading = true;

  _createSampleData() {
    List<VehicleModel> data = [];
    var d = context.read<GetMohanondaData>().previousDayModel.data;

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
    super.initState();
    var fetchData = Provider.of<GetMohanondaData>(context, listen: false);
    fetchData.get_previosreportmohanonda().then((value) {
      setState(() {
        seriesList = <charts.Series<VehicleModel, String>>[];
        _createSampleData();
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? loadingAnimation() : SafeArea(
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
        ),
      ),
    );
  }
}

class VehicleModel {
  final String day;
  final int vehicle;

  VehicleModel({
    this.day,
    this.vehicle
  });
}
