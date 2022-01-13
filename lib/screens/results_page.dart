import 'package:bmi_calculator/const/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiResult, this.resultText, this.interpretations});

  final String bmiResult;
  final String resultText;
  final String interpretations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
              "Your Results",
              style: kResultStyle,
            )),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kACTIVE_CARD_COLOR,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(bmiResult,
                      style: kNumberTextStyle.copyWith(fontSize: 80.0)),
                  Text(
                    interpretations,
                    style: TextStyle(fontSize: 20.0, color: Color(0xFF8D8E98)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ), //result Container
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("Re-Calculate", style: kCalculateStyle),
              color: kBOTTOM_CONTAINER_COLOR,
              width: double.infinity,
              height: kBOTTOM_CONTAINER_HEIGHT,
              padding: EdgeInsets.only(bottom: 10.0),
              margin: EdgeInsets.only(top: 10.0),
            ),
          ) //calculate Container
        ],
      )),
    );
  }
}
