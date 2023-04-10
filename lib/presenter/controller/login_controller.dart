import 'package:fitness_tracker/view/screens/started_screen.dart';
import 'package:fitness_tracker/view/screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../service/cache_helper.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isChecked = false.obs;
  var obscureText = true.obs;
  var isLoading= false.obs;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> _firebaseUser = Rx<User?>(null);

  String? errorMessage;
  void toggleObscureText() {
    obscureText.value = !obscureText.value;
    update();
  }
  @override
  void onInit() {
    super.onInit();
    // Listen to Firebase user changes
    _auth.authStateChanges().listen((User? user) {
      _firebaseUser.value = user;
    });
  }

  // Getter for Firebase user
  User? get firebaseUser => _firebaseUser.value;

  // Login method
  Future<void> login() async {

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      errorMessage = null;
      emailController.text = '';
      passwordController.text = '';
      Get.snackbar('Success', ' Login successful',backgroundColor: Colors.greenAccent,colorText: Colors.white);
      await LocalStorage.saveLoginKey(userCredential.user!.uid);

      Get.to(()=>const WorkoutScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {

        errorMessage = 'No user found for that email.';

      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = e.message;
      } Get.snackbar('Error', errorMessage!,backgroundColor: Colors.redAccent,colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', e.toString(),backgroundColor: Colors.redAccent,colorText: Colors.white);
      errorMessage = e.toString();
    }
    update();
  }

  // Logout method
  Future<void> logout() async {
    await _auth.signOut();
  }
}

