import 'package:fitness_tracker/view/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_button.dart';
class StartedScreen extends StatelessWidget {
  const StartedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.18,
            width: screenWidth,
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
          SizedBox(
            height: screenHeight * 0.2,
          ),
          CustomButton(
              onPressed: () => Get.to(() =>  OnBoardingScreen()),
              text: "Get Started"),
        ],
      ),
    );
  }
}
