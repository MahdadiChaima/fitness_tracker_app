import 'package:fitness_tracker/presenter/controller/register_controller.dart';
import 'package:fitness_tracker/view/screens/register/success_registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../widgets/custom_button.dart';

class RegisterScreen4 extends StatelessWidget {
  const RegisterScreen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (controller) {
              return Column(
                children: [
                  SizedBox(height: 150,),
                  ElevatedButton(
                    onPressed: controller.pickImage,
                    child: Text('Select Image'),
                  ),
                  if (controller.image != null)
                    CircleAvatar(
                      backgroundImage: FileImage(controller.image!),
                      radius: 50,
                    ),
                  ElevatedButton(
                    onPressed: controller.uploadUserData,
                    child: Text('Upload Image'),
                  ),
                  CustomButton(
                    text: 'Button',
                    onPressed: () {
                      Get.to(() => const SuccessRegistration());
                    },
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
