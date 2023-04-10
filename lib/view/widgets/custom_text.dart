import 'package:fitness_tracker/view/widgets/colors.dart';
import 'package:flutter/material.dart';
class CustomTextWidget extends StatelessWidget {
  final int index;
  final String text;
  final Color? color;
   CustomTextWidget({required this.index, required this.text,this.color=titleTextColor});
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    switch (index) {
      case 1://head
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: titleTextColor
        );
        break;
      case 2://Subtitle
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: subTitleTextColor
        );
        break;
      case 3://semiBold
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: color
        );
        break;
      case 4://medium
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w500,
            color: titleTextColor
        );
        break;
      case 5:
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w400,
        );
        break;
      case 6:
        textStyle = const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w400,

        );
        break;
      case 7:
        textStyle =const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: lineTextColor
        );
        break;
      case 8://underLine Text
        textStyle=const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: lineTextColor,
          decoration: TextDecoration.underline,
          decorationColor: lineTextColor,
          decorationThickness: 1.5,
        );
        break;
      default:
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
        );
    }
    return Text(
      text,
      style:textStyle,
    );
  }
}
