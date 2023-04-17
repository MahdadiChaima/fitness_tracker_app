import 'package:fitness_tracker/view/screens/login_screen.dart';
import 'package:fitness_tracker/view/screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../view/widgets/custom_snackbar.dart';
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
      CustomSnackbar('Success',' Login successful',isSuccess: true);

      await CacheHelper.saveData(
          key: 'token', value:userCredential.user!.uid);
      Get.to(()=>const WorkoutScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = e.message;
      }
      CustomSnackbar('Error',errorMessage!);
    } catch (e) {
      CustomSnackbar('Error', e.toString());
      errorMessage = e.toString();
    }
    update();
  }
  void resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      CustomSnackbar('Password Reset Email Sent', 'Check your email for instructions',isSuccess: true);

    } on FirebaseAuthException catch (e) {
      CustomSnackbar('Error Sending Password Reset Email', e.toString());

    }
  }
  // Logout method
  Future<void> logout() async {
    await _auth.signOut();
    Get.to(()=>LoginScreen());
    await CacheHelper.removeData(key: 'token');
  }
}

