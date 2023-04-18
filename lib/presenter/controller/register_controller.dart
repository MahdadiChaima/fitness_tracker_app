import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_tracker/model/data/user_model.dart';
import 'package:fitness_tracker/presenter/service/cache_helper.dart';
import 'package:fitness_tracker/view/screens/register/register_screen_2.dart';
import 'package:fitness_tracker/view/screens/register/success_registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:path/path.dart' as Path;

import '../../view/widgets/custom_snackbar.dart';

class RegisterController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController yourWeightController = TextEditingController();
  TextEditingController yourHeightController = TextEditingController();
  String userId = '';
  RxBool isChecked = false.obs;
  RxBool isImproveShape=false.obs;
  RxBool isLeanTone=false.obs;
  RxBool isLoseFat=false.obs;
  RxBool isMale=false.obs;
  var obscureText = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
    update();
  }

  late PageController _pageController;
  double currentPageValue = 0.0;
  int? selectedGoalIndex;

  @override
  void onInit() {
    super.onInit();
    _pageController = PageController();
    _pageController.addListener(() {
      currentPageValue = _pageController.page!;
      update();
    });
  }

  PageController get pageController => _pageController;

  void setSelectedGoalIndex(int index) {
    selectedGoalIndex = index;
    update();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final RxBool isLoading = false.obs;

  Future<void> register() async {
    String email = emailController.text;
    String password = passwordController.text;
    try {
      isLoading.value = true;

      // Create a new user account in Firebase
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential);
      userId = userCredential.user!.uid;
      await CacheHelper.saveData(
          key: 'token', value:userCredential.user!.uid);
      // Show success message
      CustomSnackbar('Success', 'Registration successful', isSuccess: true);
      Get.to(() => RegisterScreen2());
      isLoading.value = false;
    } catch (e) {
      CustomSnackbar('Error', e.toString());
      isLoading.value = false;
    }
  }

  File? _imageFile;

  String? _fileName;
  var pickedFile;
  File? file;
  File? get image => _imageFile;

  Future<void> pickImage() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      _fileName = Path.basename(file!.path);
      _imageFile = File(pickedFile.path);
      print("image selected: ${_imageFile?.path}");
      update();
    }
  }

  Future<void> uploadUserData() async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('images')
          .child(userId)
          .child(_fileName!);
      await ref.putFile(file!);
// Get the download URL of the uploaded image
      final imageUrl = await ref.getDownloadURL();
      final user = UserInformation(
          username: nameController.text,
          email: emailController.text,
          uid: userId,
          userImage: imageUrl,
          dateBirth: DateTime.parse(dateBirthController.text),
          weight: int.parse(yourWeightController.text),
          isMale: isMale.value,
          height: int.parse(yourHeightController.text),
          improveShape: isImproveShape.value,
          leanTone: isLeanTone.value,
          loseFat: isLoseFat.value,
          phoneNumber: phoneController.text);
// Store the user data and image URL in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(user.toMap());
      CustomSnackbar("Success", "User data and image have been uploaded successfully",isSuccess:true);
      Get.to(()=>SuccessRegistration());
    }
    catch(e){
      CustomSnackbar("Error", "An error occurred while uploading user data and image");
      print(e.toString());
    }
  }

  Future<void> getUserData() async {
    try {
      isLoading.value = true;

      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
      await firestore.collection('users').doc(userId).get();

      if (documentSnapshot.exists) {
        final userData = UserInformation.fromMap(documentSnapshot.data()!);
        print(userData.username);
        // do something with userData
      }

      isLoading.value = false;
    } catch (e) {
      CustomSnackbar('Error', e.toString());
      isLoading.value = false;
    }
  }

}
