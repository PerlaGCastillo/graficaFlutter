import 'package:flutter/material.dart';
import 'package:pie/ui/pieChart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pie, linear, bar charts',
      theme: ThemeData(
        //primaryColor: colors.green,
      ),
      home: ChartsPage(),
    );
  }
}