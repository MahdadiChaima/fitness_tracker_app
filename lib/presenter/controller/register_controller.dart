import 'package:fitness_tracker/view/screens/started_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isChecked = false.obs;
  var obscureText = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
    update();
  }


  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final RxBool isLoading = false.obs;

  Future<void> register() async {
    String email=emailController.text;
    String password=passwordController.text;
    try {
      isLoading.value = true;



      // Create a new user account in Firebase
      final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential);
      // Show success message
      Get.snackbar('Success', 'Registration successful',backgroundColor: Colors.greenAccent,colorText: Colors.white);

      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString(),backgroundColor: Colors.redAccent,colorText: Colors.white);
      isLoading.value = false;
    }
  }

}