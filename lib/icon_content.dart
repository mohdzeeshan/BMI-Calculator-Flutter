import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';


class iconWidget extends StatelessWidget {



  final IconData genderIcon;
  final String gender;
  const iconWidget({@required this.genderIcon, @required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),

        SizedBox(height: 20,),
        Text(
          gender,
          style: labelTextStyle,
        ),
      ],
    );
  }
}