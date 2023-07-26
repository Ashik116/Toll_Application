import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousReportCharsindurDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Regnum%20Charsindur/previousReportregnumCharsindurDataModule.dart';

class PreviousRevenueGraphRegnumCharsindur extends StatefulWidget {
  @override
  _PreviousRevenueGraphRegnumCharsindurState createState() =>
      _PreviousRevenueGraphRegnumCharsindurState();
}

class _PreviousRevenueGraphRegnumCharsindurState
    extends State<PreviousRevenueGraphRegnumCharsindur> {
  List<charts.Series<VehicleModel, String>> seriesList;

  String pointerValue;

  _createSampleData() async {
    List<VehicleModel> data = [];

    for (var v
    in context.read<PreviousReportDataModuleRegnumCharsindur>().dataList2) {
      data.add(VehicleModel(
          day: v.date.substring(8, 10),
          revenue: (int.parse(v.dailyTotalAmount))));
    }

    seriesList.add(charts.Series(
      data: data,
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (VehicleModel vehicleModel, _) => vehicleModel.day,
      measureFn: (VehicleModel vehicleModel, _) => vehicleModel.revenue,
      labelAccessorFn: (VehicleModel vehicleModel, _) =>
          vehicleModel.revenue.toString(),
      id: 'Revenue',
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
          animate: true,

          primaryMeasureAxis: new charts.NumericAxisSpec(
              tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                  desiredTickCount: 10)),
          barRendererDecorator: charts.BarLabelDecorator<String>(
            labelPosition: charts.BarLabelPosition.inside,
          ),
          domainAxis: charts.OrdinalAxisSpec(),
          behaviors: [
            charts.ChartTitle(
              pointerValue,
              titleStyleSpec: charts.TextStyleSpec(
                  color: charts.MaterialPalette.green.shadeDefault),
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification:
              charts.OutsideJustification.middleDrawArea,
            ),
          ],

          selectionModels: [
            charts.SelectionModelConfig(
                changedListener: (charts.SelectionModel model) {
                  if (model.hasDatumSelection)
                    setState(() {
                      pointerValue =
                      "Date-${model.selectedSeries[0].domainFn(model.selectedDatum[0].index).toString()}: ${model.selectedSeries[0].measureFn(model.selectedDatum[0].index).toString()} tk";
                    });
                })
          ],
          //vertical: false,
          // barRendererDecorator: charts.BarLabelDecorator<String>(
          //   insideLabelStyleSpec:  charts.TextStyleSpec(fontSize: 12),
          // ),
          //domainAxis: new charts.OrdinalAxisSpec(),
        ),
      ),
    );
  }
}

class VehicleModel {
  final String day;
  final int revenue;

  VehicleModel({this.day, this.revenue});
}
