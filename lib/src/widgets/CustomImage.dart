import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final double width;
  final double height;
  final double margin;
  final String image_path;

  const CustomImage({
    Key key,
    @required
    this.width,
    this.height,
    this.image_path,
    this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height, margin: EdgeInsets.all(margin),
      child: Image.asset(image_path, fit: BoxFit.contain,),
    );
  }
}