import 'dart:math';

import 'package:flutter/material.dart';

class Brain{
  Brain({this.weight, this.height});
  int height;
  int weight;
  double _bmi =0;

  String CalculateBMI(){

  _bmi= weight / pow(height / 100, 2);
  return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >=25)
      {
        return 'Overweight';
      }
    else if(_bmi >18.5){
      return 'Normal';
    }
    else
      return 'Underweight';
  }

  String Interpretation(){
    if(_bmi >= 25)
    {return 'You are overWeighted. GO and Exercise';}
    else if(_bmi > 18.5) {return 'Well look at you, The Fit Guy';}
    else{
      return 'EAT MOREEE!!!';
    }
  }

}