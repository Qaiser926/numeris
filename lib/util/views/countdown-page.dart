import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeris/count/Q3.dart';
import '../result_message.dart';



class CountdownPage extends StatefulWidget {
  final Widget path;
   const CountdownPage({Key? key, required this.path}) : super(key: key);

  @override
  CountdownPageState createState() => CountdownPageState();
}

class CountdownPageState extends State<CountdownPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;
  void checkResult() {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Time_out!'.tr,
            onTap: goToNextQuestion,
            icon: Icons.arrow_forward,
          );
        });



  }



  void goToNextQuestion() {
    // dismiss alert dialog

    Navigator.of(context).pop();


    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  widget.path));


  }


  void notify() {
    if (countText == '0:00:00') {
      setState(() {
        checkResult();

      });
    }
  }


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 40), () {
      checkResult();
    });
    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 40),
    // );


    // controller.addListener(() {
    //   notify();
    //   if (controller.isAnimating) {
    //     setState(() {
    //       progress = controller.value;
    //     });
    //   } else {
    //     setState(() {
    //       progress = 1.0;
    //       isPlaying = false;
    //     });
    //   }
    // });
    // controller.reverse(
    //     from: controller.value == 0 ? 1.0 : controller.value);
    // setState(() {
    //   isPlaying = true;
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // SizedBox(
          //   width: MediaQuery
          // .of(context).size.width*0.095,
          //   height: MediaQuery
          //       .of(context).size.width*0.095,
          //   child: CircularProgressIndicator(
          //     backgroundColor: Colors.grey.shade300,
          //     value: progress,
          //     strokeWidth: MediaQuery
          //         .of(context).size.width*0.095/13.3,
          //   ),
          // ),
    //       GestureDetector(
    //         onTap: () {
    //           if (controller.isDismissed) {
    //             showModalBottomSheet(
    //               context: context,
    //               builder: (context) => Container(
    //                 height: 100,
    //                 child: CupertinoTimerPicker(
    //                   initialTimerDuration: controller.duration!,
    //                   onTimerDurationChanged: (time) {
    //                     setState(() {
    //                       controller.duration = time;
    //                     });
    //                   },
    //                 ),
    //               ),
    //             );
    //           }
    //         },
    // //         child: AnimatedBuilder(
    // //           animation: controller,
    // //           builder: (context, child) => const Text(
    // //             ''
    // // //             countText,
    // // //
    // // //             style:  GoogleFonts.montserrat(
    // // // textStyle:TextStyle(
    // // //               color: Colors.red,
    // // //               fontSize: MediaQuery
    // // //                   .of(context).size.width*0.095/6.7,
    // // //               fontWeight: FontWeight.bold,
    // // //             ),
    // //             ),
    // //           ),
    //         ),

        ],
      ),
    );
  }
}
