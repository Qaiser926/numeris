
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BackgroundImage1 extends StatefulWidget {
  final String imagePath;

  const BackgroundImage1({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<BackgroundImage1> createState() => _BackgroundImage1State();
}

class _BackgroundImage1State extends State<BackgroundImage1> {

  dynamic imageAsset;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imagePath),
          fit: BoxFit.fill,
          // colorFilter: const ColorFilter.mode(Colors.white10, BlendMode.softLight),
        ),
      ),
    );
  }
}


