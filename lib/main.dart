import 'package:fitness_tracker/view/screens/login_screen.dart';
import 'package:fitness_tracker/view/screens/register/register_screen_2.dart';
import 'package:fitness_tracker/view/screens/register/register_screen_1.dart';
import 'package:fitness_tracker/view/screens/started_screen.dart';
import 'package:fitness_tracker/view/screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'presenter/service/cache_helper.dart';


void main() async {
  String? token='';
  bool? onBoarding;
  Widget startWidget=const StartedScreen();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   token=await CacheHelper.importData(key: 'token');
  onBoarding =await  CacheHelper.importData(key: 'onBoarding');
  if (onBoarding != null) {
    if (token != null) {
      startWidget = const WorkoutScreen();
    } else {
      startWidget =  LoginScreen();
    }
  } else {
    startWidget = const StartedScreen();
  }


  runApp( GetMaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: startWidget,
    )
  );
}
