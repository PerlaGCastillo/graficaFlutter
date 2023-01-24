import 'package:pie/network/networkChart.dart';
import 'package:pie/models/barModels.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class BarChartApp extends StatefulWidget {
  const BarChartApp({Key? key}) : super(key: key);

  @override
  State<BarChartApp> createState() => _BarChartAppState();
}

class _BarChartAppState extends State<BarChartApp> {
  List<BarModel> bar = [];
  bool loading = true;
  NetworkHelper _networkHelper = NetworkHelper();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var response = await _networkHelper.get(
        "http://xignumresearch.com/apicrm/api/Dashboard/getTopOrigins");
    List<BarModel> tempdata = barModelFromJson(response.body);
    setState(() {
      bar = tempdata;
      loading = false;
    });
  }

  List<charts.Series<BarModel, String>> _createSampleData() {
    return [
      charts.Series<BarModel, String>(
        data: bar,
        id: 'barID',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (BarModel barModel, _) => barModel.origen,
        measureFn: (BarModel barModel, _) => barModel.total,
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
          child: charts.BarChart(
            _createSampleData(),
            animate: true,
          ),
        ),
      ),
    );
  }
  }
