
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Charsindur/previousReportCharsindurDataModule.dart';

class PreviousRevenueGraphCharsindur extends StatefulWidget {
  @override
  _PreviousRevenueGraphCharsindurState createState() =>
      _PreviousRevenueGraphCharsindurState();
}

class _PreviousRevenueGraphCharsindurState
    extends State<PreviousRevenueGraphCharsindur> {
  List<charts.Series<VehicleModel, String>> seriesList;

  bool animate = true;
  String pointerValue;

  _createSampleData() {
    List<VehicleModel> data = [];

    for (var v in context.read<PreviousReportCharsindurDataModule>().dataList) {
      data.add(VehicleModel(
          day: v.date.substring(0, 2),
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
          behaviors: [
            charts.ChartTitle(pointerValue,
                titleStyleSpec: charts.TextStyleSpec(
                  color: charts.MaterialPalette.green.shadeDefault
                ),
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
          ],

          selectionModels: [
            charts.SelectionModelConfig(
                changedListener: (charts.SelectionModel model) {
              if (model.hasDatumSelection)

                setState(() {
                  pointerValue = "Date-"+model.selectedSeries[0]
                      .domainFn(model.selectedDatum[0].index).toString()+": "+model.selectedSeries[0]
                      .measureFn(model.selectedDatum[0].index)
                      .toString()+" tk";
                });

            })
          ],

          animate: animate,
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
