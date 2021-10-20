import 'package:flutter/material.dart';

class CustomText {
  Text buildText(String string, Color color, FontWeight weight, double size) {
    return Text(
      string,
      style: TextStyle(color: color, fontWeight: weight, fontSize: size),
    );
  }

  Text buildTextStyle(String string, Color color, FontWeight weight,
      FontStyle style, double size) {
    return Text(
      string,
      style: TextStyle(
          color: color, fontWeight: weight, fontStyle: style, fontSize: size),
    );
  }

  CustomText();
}
