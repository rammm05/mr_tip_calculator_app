import 'package:flutter/material.dart';
import 'package:tip_calculator/mr_tip_calc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MrTipCalc(),
      debugShowCheckedModeBanner: false,
    );
  }
}

