import 'package:fitness_tracker/presenter/controller/register_controller.dart';
import 'package:fitness_tracker/view/screens/register/success_registration.dart';
import 'package:fitness_tracker/view/widgets/custom_text.dart';
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
                  SizedBox(height: 100,),
                  CustomTextWidget(index: 1, text: "UPLOAD YOUR"),
                  CustomTextWidget(index: 1, text: "PROFILE PICTURE"),

                  SizedBox(height: 30,),
                  controller.image != null?
                    CircleAvatar(
                      backgroundImage: FileImage(controller.image!),
                      radius: 150,
                    ):Stack(
                      children: [
                        CircleAvatar(backgroundColor: Colors.transparent,
                          child: Image.asset("assets/images/uploadImg.png"),radius: 150,),
                        Positioned(bottom: 0,
                            right: 20
                           , child: ElevatedButton(
                            onPressed: controller.pickImage,
                            child: Icon( //<-- SEE HERE
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: CircleBorder(), //<-- SEE HERE
                              padding: EdgeInsets.all(10),
                            ),
                          ),)
                      ],
                    ),
                  SizedBox(height: 30,),

                  CustomButton(
                    text: 'Submit',
                    onPressed: controller.uploadUserData,
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
