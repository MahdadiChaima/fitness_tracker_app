import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'colors.dart';
class DefaultTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final TextEditingController controller ;
  final  GestureTapCallback onPressed ;
  final double borderRadius;
  final TextInputType type;
  IconData? suffix ;
  Function? suffixFunction;
  bool obscuretext  ;
  String? textForEmptyUnValid ;
  final String? Function(String? value)? validatorFn;

  DefaultTextField({Key? key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    required this.onPressed,
    required this.type,
    this.borderRadius = 14.0,
    this.suffix,
    this.suffixFunction,
    this.obscuretext=false,
     required this.validatorFn,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
      color: textFieldCBackgroundColor,
      child:  TextFormField(
        obscureText: obscuretext,
        keyboardType:type ,
        onTap: onPressed,
        validator: validatorFn,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
            onPressed: () {
              suffixFunction!();
            },
            icon: Icon(suffix),
          ),
          hintText: hintText,
        ),

      ),
    );
  }
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length != 6 || int.tryParse(value) == null) {
    return 'Password should contain exactly 6 digits';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  if (!value.contains('@gmail.com')) {
    return 'Email should be a valid gmail address';
  }
  return null;
}

String? validateHeight(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your height';
  }
  double? height = double.tryParse(value);
  if (height == null || height < 100.0 || height > 250.0) {
    return 'Please enter a height between 100 cm to 250 cm';
  }
  return null;
}

String? validateWeight(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your weight';
  }
  double? weight = double.tryParse(value);
  if (weight == null || weight < 30.0 || weight > 120.0) {
    return 'Please enter a weight between 30 kg to 120 kg';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  if (value.length != 10 || int.tryParse(value) == null) {
    return 'Phone number should contain exactly 10 digits';
  }
  return null;
}


String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }
  if (value.length < 3) {
    return 'Name should contain at least three letters';
  }
  return null;
}
String? validateDateOfBirth(String? value) {
  if (value == null || value.isEmpty ) {
    return 'Date of birth is required';
  }


  return null;
}
