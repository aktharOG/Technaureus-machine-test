import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String name;
  final double fontsize;
  final FontWeight? fontweight;
  final Color? color;
  final bool align;
  final int? maxlines;
  final TextDirection? textDirection;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final List<Shadow>? shadows;
  final Color? decorationColor;
  final double? height;
  final String? fontFamily;
  const CustomText(
      {super.key,
      required this.name,
      this.fontsize = 15,
      this.fontweight,
      this.color,
      this.align = false,
      this.maxlines,
      this.textDirection,
      this.decorationStyle,
      this.decoration,
      this.textAlign,
      this.shadows,
      this.decorationColor,
      this.height,
      this.fontFamily
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontFamily: fontFamily,
          height: height,
          shadows: shadows,
          fontSize: fontsize,
          fontWeight: fontweight,
          color: color ?? Colors.black,
          decorationStyle: decorationStyle,
          decoration: decoration,
          decorationColor: decorationColor ?? Colors.black),
      textAlign: textAlign ?? (align ? TextAlign.center : TextAlign.start),
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      textDirection: textDirection,
    
    );
  }
}
