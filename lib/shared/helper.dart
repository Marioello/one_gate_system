import 'package:flutter/material.dart';
import 'package:one_gate_system/shared/constants.dart';

Widget textHelper(
  String text, {
  double size = fntSizeDef14,
  FontWeight weight = FontWeight.normal,
  FontStyle style = FontStyle.normal,
  String fontFamily = 'Montserrat-Regular',
  double? letterSpacing,
  Color color = Colors.black,
  List<Shadow>? shadows,
  dynamic onTap,
}) {
  ///
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontStyle: style,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      color: color,
      shadows: shadows,
    ),
  );
}
