import 'package:fitness_tracker/view/screens/started_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(GetMaterialApp(
    title: 'Fitness Tracker',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
    ),
    home: const StartedScreen(),
  ));
}
