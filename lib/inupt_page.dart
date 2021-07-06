import 'package:bmi_calculator/brain.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusableWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

enum Gender {female, male}
int height =180;
int weight = 1;
int age=1;


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: ReuseableWidget(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },
                  color: selectedGender==Gender.male ?KActiveCardColor : KInactiveCardColor,
                  cardChild: iconWidget(genderIcon: FontAwesomeIcons.male  ,gender: 'Male'),
                ),
              ),
              Expanded(child: ReuseableWidget(
                onPress: (){
                 setState(() {
                   selectedGender=Gender.female;
                 });
                },
                color: selectedGender==Gender.female ?KActiveCardColor : KInactiveCardColor,
                cardChild: iconWidget(genderIcon:FontAwesomeIcons.female,  gender: 'Female',
              ),
              ),
              ),
            ],
          ),),
          Expanded(child: ReuseableWidget(
            color: KActiveCardColor,
            cardChild: Column( mainAxisAlignment:  MainAxisAlignment.center,
             children: [
               Text('HEIGHT', style: labelTextStyle,),
               Row( mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.baseline,
                 textBaseline: TextBaseline.alphabetic,
                 children: [
                   Text(height.toString(),
                   style: KNumberTextStyle,
                   ),
                   Text('cm',
                   style: labelTextStyle,),

                 ],
               ),
               SliderTheme(
                 data: SliderTheme.of(context).copyWith(
                   activeTrackColor: Colors.white,
                   inactiveTrackColor: Color(0xFF8D8E98),
                   thumbColor: Color(0xFFEB1555),
                   thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                   overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                 ),

                 child: Slider(
                   value: height.toDouble(),
                   min: 30,
                   max: 240,
                   onChanged: (double newValue){
                     setState(() {
                       height= newValue.round();
                     });
                   },

                 ),
               ),
             ],
            ),

          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: ReuseableWidget(color: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Weight',style: labelTextStyle,),
                    Text(weight.toString(), style: KNumberTextStyle,),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButton(icon: FontAwesomeIcons.minus,
                          onPress: (){
                          setState(() {
                            weight--;
                          });

                        }, ),
                        SizedBox(width: 10,),
                        RoundButton(icon: FontAwesomeIcons.plus,
                          onPress: (){
                          setState(() {
                            weight++;
                          });

                          }, ),
                      ],
                    ),
                  ],
                ),
              ),),
              Expanded(child: ReuseableWidget(color:KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Age',style: labelTextStyle,),
                    Text(age.toString(), style: KNumberTextStyle,),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButton(icon: FontAwesomeIcons.minus,
                          onPress: (){
                            setState(() {
                              age--;
                            });

                          },

                        ),
                        SizedBox(width: 10,),
                        RoundButton(icon: FontAwesomeIcons.plus,
                          onPress: (){
                            setState(() {
                              age++;
                            });

                          }, ),
                      ],
                    ),
                  ],
                ),

              ),),
            ],
          ),),
          BottomButton(onTap: (){
            Brain calc =Brain(weight: weight, height: height);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calc.CalculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.Interpretation(),
            ) ));},
          buttonTitle: 'Calculate',),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       onTap();

      },
      child: Container(
        child: Center(child: Text(buttonTitle, style: KLargeButtonTextStyle,)),
        margin: EdgeInsets.only(top:10),
        padding: EdgeInsets.only(bottom: 20),
        color: KBottomContainerColor,
        width: double.infinity,
        height: KBottomContainerHeight,
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape:CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56,
          height: 56,
        ),

        onPressed: onPress);


  }
}




