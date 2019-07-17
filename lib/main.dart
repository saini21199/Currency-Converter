import 'package:flutter/material.dart';
import './screens/currency_converter.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      home: Currencyconverter(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}