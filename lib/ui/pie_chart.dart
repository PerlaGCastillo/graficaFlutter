import 'package:pie/network/networkChart.dart';
import 'package:pie/models/pieModels.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class PieChartApp extends StatefulWidget {
  const PieChartApp({Key? key}) : super(key: key);

  @override
  State<PieChartApp> createState() => _PieChartAppState();
}

class _PieChartAppState extends State<PieChartApp> {
  List<PieModel> pie = [];
  bool loading = true;
  NetworkHelper _networkHelper = NetworkHelper();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var response = await _networkHelper.get(
        "http://xignumresearch.com/apicrm/api/Dashboard/getTotalAnualProspects");
    List<PieModel> tempdata = pieModelFromJson(response.body);
    setState(() {
      pie = tempdata;
      loading = false;
    });
  }

  List<charts.Series<PieModel, String>> _createSampleData() {
    return [
      charts.Series<PieModel, String>(
        data: pie,
        id: 'pieID',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (PieModel pieModel, _) => pieModel.abiertos,
        measureFn: (PieModel pieModel, _) => pieModel.cerrados,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gráficas"),
      ),
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : Container(
          height: 120,
          child: charts.PieChart(series,
              defaultRenderer: charts.ArcRendererConfig(
                  arcRendererDecorators: [
                    charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.inside)
                  ]),
              animate: true),
        )
      ),
    );
  }
}
