import 'package:flutter/material.dart';

import 'colors.dart';
class DefaultTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final TextEditingController controller ;
  final  GestureTapCallback onPressed ;
  final double borderRadius;
  final TextInputType type;
  Icon? suffixIcon ;
  bool obscuretext  ;
  DefaultTextField({Key? key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    required this.onPressed,
    required this.type,
    this.borderRadius = 14.0,
    this.suffixIcon,
    this.obscuretext=false

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: textFieldCBackgroundColor,
      child:  TextField(
        obscureText: obscuretext,
        keyboardType:type ,
        onTap: onPressed,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
        ),

      ),
    );
  }
}
