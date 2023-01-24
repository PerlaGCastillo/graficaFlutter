import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pieModels.dart';

void main() => runApp(ChartsPage());

class ChartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  static get jsonData => null;

  //Future <List<PieData>>
  _getData() async{
    final response = await http.get(Uri.parse('http://xignumresearch.com/apicrm/api/Dashboard/getTotalAnualProspects'),);
    //List<PieData> data = [];
    Map<String,dynamic> map = json.decode(response.body);
    print(map['data'].length);
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done)
              return new charts.PieChart(
                  dataList(snapshot.data),
                  defaultRenderer: new charts.ArcRendererConfig(
                      arcRendererDecorators: [new charts.ArcLabelDecorator()])
              );
            else
              return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }


  static List<charts.Series<DataList, String>> dataList(Map<String, dynamic> apiData) {
    List<DataList> list = [];

    for(var item in jsonData['data'].length);
      data.add(PieData(item["abiertos"],item["cerrados"]));
    }
    return data;
  }else {
  throw Exception("Falló la conexión");
}
