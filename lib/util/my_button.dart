import 'package:flutter/material.dart';
import '../const.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttonColor = Colors.deepPurple[400];

  MyButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == 'C') {
      buttonColor = Colors.green;
    } else if (child == 'DEL') {
      buttonColor = Colors.red;
    } else if (child == '=') {
      buttonColor = Colors.deepPurple;
    }

    return Padding(
      padding:  const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.0025,),
          width: MediaQuery.of(context).size.width * 0.055,
          height: MediaQuery.of(context).size.width * 0.055,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 4, color: buttonColor!),
              color: buttonColor
          ),
          child: Center(
            child: DefaultTextStyle(style: whiteTextStyle,
            child: Text(child, style: whiteTextStyle)),
          ),
        ),
      ),
    );
  }
}
