import 'package:fitness_tracker/presenter/controller/register_controller.dart';
import 'package:fitness_tracker/view/widgets/custom_button.dart';
import 'package:fitness_tracker/view/widgets/custom_text_field.dart';
import 'package:fitness_tracker/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/colors.dart';
import '../widgets/text_style.dart';
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
                          const Text(
                        'Hey there,',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ), 
                          const Text(
                        'Create an account',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ), 
                          SizedBox(height: 100,),
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
                          DefaultTextField(controller: registerController.passwordController,
                            prefixIcon: Icon(Icons.lock), hintText: 'Password',
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {},
                        type: TextInputType.visiblePassword,
                        obscuretext: true,
                      ),
                          Space(),
                          Obx(()  {
                            return Row(
                              children: [
                            Checkbox(
                            value: registerController.isChecked.value,
                              onChanged: (value) {
                                registerController.isChecked.value = value!;
                              },
                            ),
                                 Flexible(child:
                                 Text.rich(
                                   TextSpan(
                                    children: [
                                      MyText('By continuing you accept our '),
                                      MyTextLine('Privacy Policy'),
                                      MyText(' and '),
                                      MyTextLine('Term of Use'),
                                    ],
                                  ),
                                  maxLines: 2,
                                )
                                ),
                              ],
                            );
                          }),
                          Space(),
                          CustomButton(
                        text: 'Register',
                        onPressed: () => registerController.register(),
                      ),
                          Space(),
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
                            onTap: (){},
                            child: Image.asset('assets/images/google.png'),
                          ),
                          Space(),
                          GestureDetector(
                            onTap: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Already have an account?',style:TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),),
                                Text('Login',style:TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400,
                                  color: secondColor,
                                ),),
                              ],
                            ),
                          )
                    ])))));
  }
}
