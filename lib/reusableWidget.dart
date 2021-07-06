import 'package:flutter/material.dart';

class ReuseableWidget extends StatelessWidget {

  final Color color;
  final Widget cardChild;
  final Function onPress;
  ReuseableWidget({@required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
    void GestueDetect()
    {
      GestueDetector(){
        onTap(){

        }

      }
    }
  }

}
