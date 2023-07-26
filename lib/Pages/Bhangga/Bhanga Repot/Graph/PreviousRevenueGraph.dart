import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/Provider/getBhangaData.dart';
import 'package:toll_plaza/Provider/getDhaleshwariData.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';

class PreviousRevenueGraphBhanga extends StatefulWidget {
  @override
  _PreviousRevenueGraphBhangaState createState() => _PreviousRevenueGraphBhangaState();
}

class _PreviousRevenueGraphBhangaState extends State<PreviousRevenueGraphBhanga> {
  List<charts.Series<VehicleModel, String>> seriesList;

  String pointerValue;
  bool isLoading = true;

  _createSampleData() {
    List<VehicleModel> data = <VehicleModel>[];

    for (var v in context.read<GetBhangaData>().previousDayModel.data) {
      data.add(VehicleModel(
          day: v.date.substring(8, 10),
          revenue: (int.parse(v.amount.toString()))));
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

    var fetchData = Provider.of<GetBhangaData>(context, listen: false);
    fetchData.get_previosreportBhanga().then((value) {
      setState(() {
        seriesList = <charts.Series<VehicleModel, String>>[];
        _createSampleData();
        isLoading = false;
      });
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? loadingAnimation() :
    SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: charts.BarChart(
          seriesList,
          animate: true,
          primaryMeasureAxis: new charts.NumericAxisSpec(
              tickProviderSpec: new charts.BasicNumericTickProviderSpec(desiredTickCount: 10)
          ),
          barRendererDecorator: charts.BarLabelDecorator<String>(
            labelPosition: charts.BarLabelPosition.inside,
          ),
          domainAxis: charts.OrdinalAxisSpec(),
          behaviors: [
            charts.ChartTitle(
              pointerValue,
              titleStyleSpec: charts.TextStyleSpec(
                  color: charts.MaterialPalette.green.shadeDefault
              ),
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification: charts.OutsideJustification.middleDrawArea,

            ),
          ],

          selectionModels: [
            charts.SelectionModelConfig(changedListener: (charts.SelectionModel model) {
              if (model.hasDatumSelection)
                setState(() {
                  pointerValue = "Date-" +
                      model.selectedSeries[0]
                          .domainFn(model.selectedDatum[0].index)
                          .toString() +
                      ": " +
                      model.selectedSeries[0]
                          .measureFn(model.selectedDatum[0].index)
                          .toString() +
                      " tk";
                });
            })
          ],
        ),
      ),
    );
  }
}

class VehicleModel {
  final String day;
  final int revenue;

  VehicleModel({
    this.day,
    this.revenue
  });
}
