import 'package:fitness_tracker/view/screens/register/register_screen_4.dart';
import 'package:fitness_tracker/view/widgets/custom_button.dart';
import 'package:fitness_tracker/view/widgets/custom_snackbar.dart';
import 'package:fitness_tracker/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presenter/controller/register_controller.dart';

class RegisterScreen3 extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(index: 1, text: "What is your goal?"),
              SizedBox(height: 5),
              CustomTextWidget(
                index: 2,
                text: "It will help us choose the best program for you",
              ),
              SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView(
                  controller: controller.pageController,
                  children: [
                    _buildPage("assets/images/goal1.png", 1),
                    _buildPage("assets/images/goal2.png", 2),
                    _buildPage("assets/images/goal3.png", 3),
                  ],
                ),
              ),
              CustomButton(
                  text: 'Confirm',
                  onPressed: () {
                    controller.selectedGoalIndex != null
                        ?  Get.to(() => const RegisterScreen4())
                        : CustomSnackbar("Error", "Please select your Goal");
                  }),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildPage(String imagePath, int index) {
    return Column(
      children: [
        Expanded(
          child: GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (controller) => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.setSelectedGoalIndex(index);
                  },
                  child: Transform.scale(
                    scale: 1.0 - (controller.currentPageValue % 1),
                    child: Image.asset(
                      imagePath,
                    ),
                  ),
                ),
                controller.selectedGoalIndex == index
                    ? Checkbox(
                        value: true,
                        onChanged: (_) {},
                      )
                    : Radio<int>(
                        value: index,
                        groupValue: controller.selectedGoalIndex,
                        onChanged: (value) {
                          controller.isImproveShape.value=false;
                          controller.isLeanTone.value=false;
                          controller.isLoseFat.value=false;
                         switch(index){
                           case 1: controller.isImproveShape.value=true;
                           break;
                           case 2: controller.isLeanTone.value=true;
                           break;
                           case 3: controller.isLoseFat.value=true;
                           break;
                           default: controller.isLeanTone.value=true;
                           break;
                         }

                          controller.setSelectedGoalIndex(value!);
                        },
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
