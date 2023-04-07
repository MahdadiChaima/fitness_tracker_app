import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker/view/screens/started_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try {
    print("hi");
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: "bybkkiy@gmail.com", password: "1234556");
  
    print('Successfully registered user!');
  } catch (e) {
    print('Error registering user: $e');
  }

  runApp(GetMaterialApp(
    title: 'Fitness Tracker',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
    ),
    home: const StartedScreen(),
  ));
}
