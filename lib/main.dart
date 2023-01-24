import 'package:pie/ui/barChart.dart';
//import 'package:pie/ui/pieChart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: const TextTheme(bodyText1:TextStyle(fontSize: 8.0),
    ),),
      home: const BarChartApp(),
    );
  }
}