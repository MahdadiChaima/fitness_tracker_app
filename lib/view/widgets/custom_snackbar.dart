import 'package:flutter/material.dart';
import 'package:get/get.dart';
 CustomSnackbar(String title,String message, {bool isSuccess = false}) {
  Color backgroundColor = isSuccess ?  Colors.greenAccent : Colors.redAccent;
  String title = isSuccess ? 'Success' : 'Error';
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: Colors.white,
    duration:const Duration(seconds: 3),
  );
}