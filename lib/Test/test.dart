import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:numeris/Dice(21,36,46)/Dice.dart';
import 'package:numeris/util/background-image.dart';


import '../WelcomeUI.dart';
import '../util/color_manager.dart';
import '../util/utilis.dart';

class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email,_password;
  String hint="mail@gmail.com";
  final FirebaseAuth _auth= FirebaseAuth.instance;
  Utlils utilis=Utlils();
  bool loading= false;
  String hintPassword="******";


  @override
  Widget build(BuildContext context) {
    final double scaleFactor = MediaQuery
      .of(context)
      .textScaleFactor;
    double screenHeight=  MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth=  MediaQuery
        .of(context)
        .size
        .width;
    print(  scaleFactor*20,);
    print(screenHeight);
    return LayoutBuilder(

        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              // const BackgroundImage(imagePath: "assets/bk.jpg"),
              Scaffold(
                backgroundColor: ColorManager.white,
                body: SingleChildScrollView(
                  child: Container(

                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    decoration: const BoxDecoration(

                      // gradient: LinearGradient(
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      //   colors: [
                      //
                      //     Colors.orange,
                      //
                      //
                      //     Colors.yellowAccent
                      //     ,
                      //   ],
                      // ),
                      image: DecorationImage(
                        image: AssetImage('assets/bk.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black38, BlendMode.hardLight),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(
                            //     color: ColorManager.LightRed,
                            //     width: 1,
                            //   ),
                            // ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: screenHeight*0.04,),
                                Row(
                                  children: [
                                    SizedBox(width: screenWidth*0.03,),
                                    Text(
                                      'Welcome Back!',
                                      style: TextStyle(
                                        fontSize: screenWidth*0.038,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.yellow,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1),
                                Row(
                                  children:  [
                                    SizedBox(width: screenWidth*0.07,),
                                    Center(
                                      child: Text(
                                        'Please sign in to continue.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: screenWidth*0.0177,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Expanded(
                                  flex: 3,
                                  child: Container(

                                    decoration:  const BoxDecoration(

                                      image: DecorationImage(
                                        fit: BoxFit.fill
                                        ,
                                        image: AssetImage('assets/lion.png',),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth*0.05,),
                        Expanded(

                          flex: 3,
                          child: Form(
                            key: _formKey,
                            child: Container(
                              // decoration: BoxDecoration(
                              //   border: Border.all(
                              //     color: ColorManager.LightRed,
                              //     width: 1,
                              //   ),
                              // ),

                              padding:  EdgeInsets.only(left:screenWidth*0.025),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                SizedBox(height: screenHeight*0.055,),
                                  Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: screenWidth*0.0385,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight*0.038),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              Text("Email", style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager.Yellow
                                              ),),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: screenHeight*0.05),
                                      Expanded(
                                     child:   Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Expanded(
                                              child: SizedBox(

                                                child: TextFormField(
                                                  controller: _emailController,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: screenWidth*0.025,
                                                      color: ColorManager.white
                                                  ),
                                                  keyboardType: TextInputType.emailAddress,
                                                  decoration: InputDecoration(
                                                    hintStyle:hint=="mail@gmail.com"?TextStyle(
                                                      fontSize: screenWidth*0.022,
                                                      color: ColorManager.white,
                                                      fontWeight: FontWeight.bold,
                                                    ): TextStyle(

                                                      color: Colors.red,
                                                      fontSize: screenWidth*0.016,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                    hintText: hint,

                                                    enabledBorder:hint=='mail@gmail.com'?UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: ColorManager.white
                                                      ),
                                                    ): const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    fillColor: Colors.white,
                                                    border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: ColorManager.white
                                                      ),
                                                    ),
                                                  ),
                                                  onSaved: ( value) {
                                                    _email = value!;
                                                  },
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      setState(() {
                                                        hint='Please enter your email address';
                                                      });

                                                      return null;
                                                    }
                                                    if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
                                                      return null;
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: screenWidth*0.12,)
                                          ],
                                        ),
                                      ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenHeight*0.05),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              Text("Password", style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager.Yellow
                                              ),),
                                            ],
                                          ),
                                        ),
                                        Expanded(child: SizedBox(height: 0.01,)),
                                        Expanded(
                                      child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                child: TextFormField(
                                                  controller: _passwordController,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: ColorManager.white
                                                  ),

                                                  obscureText: true,
                                                  decoration:  InputDecoration(

                                                    hintText: hintPassword,
                                                    hintStyle:hintPassword=='******'?TextStyle(

                                                      color: ColorManager.white,
                                                      fontWeight: FontWeight.normal,
                                                    ) :  TextStyle(

                                                      color: Colors.red,
                                                      fontSize: screenWidth*0.016,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                    enabledBorder:hintPassword=='******'?UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: ColorManager.white
                                                      ),
                                                    ): const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: ( value) {
                                                    if (value!.isEmpty) {
                                                      setState(() {
                                                        hintPassword= 'Password is required';
                                                      });
                                                      return null;

                                                    }
                                                    if (value!.length < 8) {
                                                      return null;
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: ( value) {
                                                    _password = value!;
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: screenWidth*0.12,)
                                          ],
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenHeight*0.06),
                                  Row(
                                    children: [
                                      SizedBox(width: screenWidth*0.025,),
                                      SizedBox(
                                        width: screenWidth*0.40,
                                        height: screenHeight*0.12,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            setState(() {
                                              loading=true;
                                            });
                                            if (_formKey.currentState!.validate()) {
                                              _formKey.currentState!.save();
                                              // Use the email and password
                                            }
                                            await _auth.signInWithEmailAndPassword(email: _emailController.text.toString(), password: _passwordController.text.toString()).then((value){
                                              utilis.toast("LOGIN SUCCESSFULLY");
                                              Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => const Welcome()));
                                              setState(() {
                                                loading= false;
                                              });

                                            }).onError((error, stackTrace) {
                                              setState(() {
                                                loading= false;
                                              });
                                              Utlils().toastMessage(error.toString());
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(

                                            elevation: 15,

                                            // padding: const EdgeInsets.all(5),
                                            backgroundColor: ColorManager.yellow,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  10),
                                            ),
                                          ),
                                          child: loading ? const CircularProgressIndicator(strokeWidth: 3, color: Colors.red,): Text('Login', style: TextStyle(
                                            color: ColorManager.button1,
                                            fontSize: screenWidth*0.022,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight*0.039),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(child: SizedBox(width: screenWidth*0.025,)),

                                      Text(
                                        'Don\'t have an account? ',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(flex: 2,child: SizedBox(width: screenWidth*0.025,)),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight*0.099),
                                ],
                              ),
                            ),
                          ),

                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}