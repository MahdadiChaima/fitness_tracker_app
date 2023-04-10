import 'package:fitness_tracker/presenter/controller/register_controller.dart';
import 'package:fitness_tracker/view/screens/login_screen.dart';
import 'package:fitness_tracker/view/widgets/custom_button.dart';
import 'package:fitness_tracker/view/widgets/custom_text.dart';
import 'package:fitness_tracker/view/widgets/custom_text_field.dart';
import 'package:fitness_tracker/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/colors.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      CustomTextWidget(index: 5, text: 'Hey there,'),
                      CustomTextWidget(index: 1, text: 'Create an account'),
                      SizedBox(
                        height: 50,
                      ),
                      DefaultTextField(
                        controller: registerController.nameController,
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Full Name',
                        onPressed: () {},
                        type: TextInputType.text,
                      ),
                      Space(),
                      DefaultTextField(
                        controller: registerController.phoneController,
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Phone Number',
                        onPressed: () {},
                        type: TextInputType.phone,
                      ),
                      Space(),
                      DefaultTextField(
                        controller: registerController.emailController,
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        onPressed: () {},
                        type: TextInputType.emailAddress,
                      ),
                      Space(),
                          GetBuilder<RegisterController>(init: RegisterController(),
                            builder: (controller)=>DefaultTextField(
                              controller: registerController.passwordController,
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Password',
                              suffix:controller.obscureText.value? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                              suffixFunction: ()=>controller.toggleObscureText(),
                              textForEmptyUnValid: "Enter you password ",
                              onPressed: () {},
                              type: TextInputType.visiblePassword,
                              obscuretext: controller.obscureText.value,
                            ),),
                      Space(),
                      Obx(() {
                        return Row(
                          children: [
                            Checkbox(
                              value: registerController.isChecked.value,
                              onChanged: (value) {
                                registerController.isChecked.value = value!;
                              },
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                          text: 'By continuing you accept our ',
                                          index: 7),
                                      CustomTextWidget(
                                          text: 'Privacy Policy', index: 8),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomTextWidget(text: ' and ', index: 7),
                                      CustomTextWidget(
                                          text: 'Term of Use', index: 8),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                      Space(),
                      CustomButton(
                        text: 'Register',
                        onPressed: (){
                          Get.find<RegisterController>().register(
                          );
                        } ),

                      Row(
                        children: const <Widget>[
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Space(),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/google.png'),
                      ),
                      Space(),
                      GestureDetector(
                        onTap: () =>Get.to(()=>LoginScreen()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWidget(
                                text: 'Already have an account ? ', index: 3),
                            CustomTextWidget(
                                text: 'Login',
                                index: 3,
                                color: primaryTextColor)
                          ],
                        ),
                      )
                    ])))));
  }
}
