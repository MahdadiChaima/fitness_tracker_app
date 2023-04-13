import 'package:fitness_tracker/view/screens/workout_screen.dart';
import 'package:fitness_tracker/view/widgets/custom_button.dart';
import 'package:fitness_tracker/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessRegistration extends StatelessWidget {
  const SuccessRegistration({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/welcome.png'),
              CustomTextWidget(index: 1, text: "Welcome, Stefani"),
              CustomTextWidget(
                  index: 2, text: "You are all set now, let’s reach your "),
              CustomTextWidget(index: 2, text: "goals together with us"),
              SizedBox(
                height: 40,
              ),
              CustomButton(text: "Go Home", onPressed: ()=>Get.to(()=>const WorkoutScreen()))
            ],
          ),
        ),
      ),
    );
  }
}
