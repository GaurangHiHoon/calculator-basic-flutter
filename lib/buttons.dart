import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  MyButton({this.color, this.textColor, this.buttonText,this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: GestureDetector(
        onTap: buttonTapped,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 1.0,
            width: 1.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              
              child: Container(
                color: color,
                padding: EdgeInsets.all(5.0),
                child: Center(
                  child:Text(buttonText, style: TextStyle(
                    color: textColor,
                    fontSize: 18.0,
                  ))
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
