import 'package:fitness_tracker/view/screens/started_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( GetMaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:const  TextTheme(
          bodyText1: TextStyle(fontFamily: 'Poppins',fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),
          headline1: TextStyle(fontFamily: 'Poppins'),
          headline2: TextStyle(fontFamily: 'Poppins'),
          headline3: TextStyle(fontFamily: 'Poppins'),
          ),
        primarySwatch: Colors.deepOrange,
      ),
      home: const StartedScreen(),
    )
  );
}
