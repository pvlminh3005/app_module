import 'package:app_module/app/cores/theme/font_family.dart';
import 'package:app_module/app/cores/value/font_size.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final EdgeInsets margin;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextAlign align;
  final TextOverflow overflow;

  const CustomText(
    this.title, {
    this.margin = const EdgeInsets.all(0),
    this.color = Colors.black,
    this.fontSize = FontSize.MEDIUM,
    this.fontWeight = FontWeight.w500,
    this.maxLines = 1,
    this.align = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: FontFamily.nunitoSans,
          color: color,
        ),
        overflow: overflow,
        maxLines: maxLines,
        textAlign: align,
      ),
    );
  }
}
