import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_tracker/view/screens/register/register_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../view/widgets/custom_snackbar.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController yourWeightController = TextEditingController();
  TextEditingController yourHeightController = TextEditingController();
  String userId='';
  RxBool isChecked = false.obs;
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
      userId=userCredential.user!.uid ;
      // Show success message
      CustomSnackbar('Success','Registration successful',isSuccess: true);
      Get.to(()=>RegisterScreen2());
      isLoading.value = false;
    } catch (e) {
      CustomSnackbar( 'Error',e.toString());
      isLoading.value = false;
    }
  }


  File? _imageFile;
  RxString? _imageUrl;

  Future<void> pickImage() async {
    print('hiiiiiii');
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    print(pickedFile);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      print("image selected: ${_imageFile?.path}");
      update();
    }
  }

  Future<void> uploadImage() async {
    print(_imageFile);
    if (_imageFile == null) return;

    try {
      // Upload image to Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now().toString()}');
      UploadTask uploadTask = storageReference.putFile(_imageFile!);

      // Log upload progress and status
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        print('Task state: ${snapshot.state}');
        print('Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
      });

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      _imageUrl = (await storageReference.getDownloadURL()) as RxString?;

      // Save download URL to Firestore
      String uid = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance.collection('users').doc(uid).update({'image': _imageUrl});
    } catch (e) {
      CustomSnackbar("error",e.toString());
      print(e.toString());
      // Handle error here
    }

    update();
  }




}