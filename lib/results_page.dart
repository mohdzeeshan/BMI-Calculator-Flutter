import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/inupt_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'reusableWidget.dart';
import 'brain.dart';
class ResultsPage extends StatelessWidget {

  ResultsPage({this.bmiResult, this.resultText, this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Results', style: KTitleTextStyle,))),
          Expanded(
              flex: 5,
              child: ReuseableWidget(
               color: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(resultText.toUpperCase(), style: resultTextStyle,),
                    Text(bmiResult, style: KBmiTextStyle,),
                    Text(interpretation,
                      textAlign: TextAlign.center,
                      style: KBodyTextStyle,),
                  ],
                ),
              ),
          ),
          Expanded(child: BottomButton(buttonTitle: 'Re-Calculate',
          onTap: (){
            Navigator.pop(context);
          },))
        ],
      ),
    );
  }
}
