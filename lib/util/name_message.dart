import 'package:flutter/material.dart';

import 'color_manager.dart';


class NameMessage extends StatelessWidget {
  final TextEditingController emailController;
  final String message;
  final VoidCallback onTap;
  final icon;

  const NameMessage({
    Key? key,
    required this.message,
    required this.onTap,
    required this.icon, required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      backgroundColor: Colors.deepPurple,
      content: SingleChildScrollView(
        child: SizedBox(

          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // the result
              Text(
                message,
                style:  const TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23 ,
                ),
              ),  SizedBox(
                width: 210,
                height: 45,
                child: TextFormField(
                  controller: emailController,



                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  cursorHeight: 23,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'jack',
                      hintStyle:  const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17 ,
                        color: Colors.white60,
                      ),
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10), // Change the padding to adjust the size

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorManager.white
                      ),

                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorManager.white
                      ),
                    ),
                  ),

                  style:  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20 ,
                    color: Colors.white,
                  ),
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
      ),
    );
  }
}
