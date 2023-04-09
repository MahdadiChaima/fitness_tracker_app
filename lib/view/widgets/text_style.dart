import 'package:flutter/material.dart';

TextSpan MyText(String text) => TextSpan(
      text: text,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Color(0xffADA4A5),
      ),
    );
TextSpan MyTextLine(String text) => TextSpan(
      text: text,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Color(0xffADA4A5),
        decoration: TextDecoration.underline,
        decorationColor: Color(0xffADA4A5),
        decorationThickness: 1.5,
      ),
    );
