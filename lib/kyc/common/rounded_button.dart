import 'package:flutter/material.dart';
import 'master_color.dart';


class RoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  final Color? color, textColor;
  const RoundedButton({
    Key? key,
    this.text,
    this.press,
    this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child:  ElevatedButton(

        style: TextButton.styleFrom(
            backgroundColor: color,
            foregroundColor: LightColor.black,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),


        onPressed: press,
        child: Text(
          text!,
          style: TextStyle(color: textColor, fontSize: 15),
        ),
      ),


    );
  }
}

class RoundedButtonSmall extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  final Color? color, textColor;
  const RoundedButtonSmall({
    Key? key,
    this.text,
    this.press,
    this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      width: size.width * 0.35,
      child:  ElevatedButton(

        style: TextButton.styleFrom(
            backgroundColor: color,
            foregroundColor: LightColor.black,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),


        onPressed: press,

        child: Text(
          text!,
          style: TextStyle(color: textColor),
        ),
      ),


    );
  }
}


class RoundedBigButton extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  final Color? color, textColor;
  const RoundedBigButton({
    Key? key,
    this.text,
    this.press,
    this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.9,
      child:  ElevatedButton(

        style: TextButton.styleFrom(
            backgroundColor: color,
            foregroundColor: LightColor.black,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),


        onPressed: press,
        child: Text(
          text!,
          style: TextStyle(color: textColor),
        ),
      ),


    );
  }
}