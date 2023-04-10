import 'package:fitness_tracker/view/screens/register_screen.dart';
import 'package:fitness_tracker/view/screens/started_screen.dart';
import 'package:fitness_tracker/view/screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'presenter/service/cache_helper.dart';

void main() async {
  String? token='';
  Widget startWidget=StartedScreen();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   token=await LocalStorage.getLoginKey();
  if (token != null) {
    print(token);
    startWidget = const WorkoutScreen();
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
