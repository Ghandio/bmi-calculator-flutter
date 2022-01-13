import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../const/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/custom_button.dart';
import 'package:bmi_calculator/calculator.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age=20;

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color(0xFF0A0D22),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Row(children: [
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                cardChild: ReusableCardContent(FontAwesomeIcons.mars, "MALE"),
                colour: selectedGender == Gender.male
                    ? kACTIVE_CARD_COLOR
                    : kINACTIVE_CARD_COLOR,
              )),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                cardChild:
                    ReusableCardContent(FontAwesomeIcons.venus, "FEMALE"),
                colour: selectedGender == Gender.female
                    ? kACTIVE_CARD_COLOR
                    : kINACTIVE_CARD_COLOR,
              ))
            ]),
          ),
          Expanded(
              child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      "CM",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8d8e98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    )),
              ],
            ),
            colour: kINACTIVE_CARD_COLOR,
          )),
          Expanded(
            child: Row(children: [
              Expanded(
                  child: ReusableCard(
                colour: kINACTIVE_CARD_COLOR,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weight",
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      CustomButton(child:FontAwesomeIcons.minus,
                      onPressed: (){
                        setState(() {
                          if(weight>0){
                            weight--;
                          }

                        });
                      },),
                      SizedBox(width:10.0 ,)
                      ,
                      CustomButton(
                        child:FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {

                            weight++;
                          });
                        },

                      )
                    ],)
                    ,

                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                colour: kINACTIVE_CARD_COLOR,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(child:FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    if(age>0){
                                      age--;
                                    }

                                  });
                                },),
                              SizedBox(width:10.0 ,)
                              ,
                              CustomButton(
                                child:FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {

                                    age++;
                                  });
                                },

                              )
                            ],)
                          ,

                        ],
                      )
              ))
            ]),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  ResultPage(
                    bmiResult:calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretations: calc.getInterpretations(),
                  )));
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("CALCULATE",style: kCalculateStyle,),
              padding: EdgeInsets.only(bottom: 10.0),
              color: kBOTTOM_CONTAINER_COLOR,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBOTTOM_CONTAINER_HEIGHT,
            ),
          )
        ]));
  }
}


