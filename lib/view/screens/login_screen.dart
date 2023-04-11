import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker/presenter/controller/register_controller.dart';
import 'package:fitness_tracker/view/screens/register/register_screen_1.dart';
import 'package:fitness_tracker/view/screens/workout_screen.dart';
import 'package:fitness_tracker/view/widgets/custom_button.dart';
import 'package:fitness_tracker/view/widgets/custom_text.dart';
import 'package:fitness_tracker/view/widgets/custom_text_field.dart';
import 'package:fitness_tracker/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/login_controller.dart';
import '../widgets/colors.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
  var keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  key: keyForm,
                  child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextWidget(index: 5, text: 'Hey there,'),
                            CustomTextWidget(index: 1, text: 'Welcome Back'),
                            SizedBox(
                              height: 50,
                            ),

                            DefaultTextField(
                              controller: _loginController.emailController,
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Email',
                              textForEmptyUnValid: "Enter you Email ",
                              onPressed: () {},
                              type: TextInputType.emailAddress,
                            ),

                            Space(),
                            GetBuilder<LoginController>(init: LoginController(),
                              builder: (controller)=>DefaultTextField(
                              controller: _loginController.passwordController,
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
                            SizedBox(height: 5,),
                            Align(alignment: Alignment.topLeft,
                              child: GetBuilder<LoginController>(
                                init: LoginController(),
                                builder:(controller)=> GestureDetector(
                                  onTap: (){
                                   controller.resetPassword();
                                  },
                                  child: CustomTextWidget(
                                      text: 'Forget Password ? ',
                                      index: 7),
                                ),
                              ),
                            ),
                            SizedBox(height: 140,),

                            GetBuilder<LoginController>(
                              init: LoginController(),
                              builder:(controller)=> Column(
                                children: [
                                  CustomButton(
                                    text: 'Login',
                                    onPressed: () async{
                                     if (keyForm.currentState!.validate()) {
                                       controller.isLoading.value=true;
                                        await controller.login().then((value) {
                                         controller.isLoading.value=false;
                                          print(controller.errorMessage);});
                                     }
                                    }
                                  ),
                                 controller. isLoading.value
                                      ? Positioned.fill(
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                      : Container(
                                 ),
                                ],
                              ),
                            ),
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
                              onTap: () =>Get.to(()=>RegisterScreen1()),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextWidget(
                                      text: 'Don’t have an account yet ?', index: 3),
                                  CustomTextWidget(
                                      text: 'Register',
                                      index: 3,
                                      color: primaryTextColor)
                                ],
                              ),
                            )
                          ])),
                ))));
  }
}
