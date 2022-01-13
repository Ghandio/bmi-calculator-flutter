import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.light(
              primary: Color(0xFF0A0D22),
              secondary: Color(0xFFEB1555)),
          scaffoldBackgroundColor: Color(0xFF0A0D22)
      ),

      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}

