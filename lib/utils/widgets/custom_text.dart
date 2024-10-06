import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calculator/utils/constants/color_constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;
  final double textSize;
  final Color? color;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int? maxLine;
  final FontStyle? fontStyle;

  const CustomText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w500,
    this.textSize = 16,
    this.color = ColorConstant.whiteColor,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
  });

  const CustomText.lightGreyColor20Medium({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w500,
    this.textSize = 20,
    this.color = ColorConstant.lightGreyColor,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
  });

  const CustomText.whiteColor30Bold({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.bold,
    this.textSize = 30,
    this.color = ColorConstant.whiteColor,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
  });

  const CustomText.whiteColor50Bold({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.bold,
    this.textSize = 50,
    this.color = ColorConstant.whiteColor,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      ),
      // softWrap: false,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          overflow: textOverflow,
          fontWeight: fontWeight,
          fontSize: textSize,
          color: color ?? ColorConstant.whiteColor,
          decoration: textDecoration,
          fontStyle: fontStyle,
        ),
      ),
      maxLines: maxLine,
    );
  }
}
