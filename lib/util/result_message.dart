import 'package:flutter/material.dart';


class ResultMessage extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  final icon;

  const ResultMessage({
    Key? key,
    required this.message,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: SizedBox(

        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // the result
            Text(
              message,
              style:  const TextStyle(
        fontWeight: FontWeight.bold,
          fontSize: 30 ,
          color: Colors.white,
        ),
            ),

            // button to go to next question
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
