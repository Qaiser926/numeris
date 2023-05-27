
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BackgroundImage extends StatefulWidget {
  final String imagePath;

  const BackgroundImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {

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
          colorFilter: const ColorFilter.mode(Colors.black12, BlendMode.softLight),
        ),
      ),
    );
  }
}


