import 'package:fitness_tracker/presenter/controller/register_page2_controller.dart';
import 'package:fitness_tracker/view/screens/register/register_screen_3.dart';
import 'package:fitness_tracker/view/widgets/custom_button.dart';
import 'package:fitness_tracker/view/widgets/custom_text.dart';
import 'package:fitness_tracker/view/widgets/custom_text_field.dart';
import 'package:fitness_tracker/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/colors.dart';

class RegisterScreen2 extends StatelessWidget {
  final RegisterPage2Controller registerControllerPage2 =
      Get.put(RegisterPage2Controller());

  @override
  Widget build(BuildContext context) {
    String? selectedGender;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/register.png'),
              CustomTextWidget(
                index: 1,
                text: 'Let’s complete your profile',
              ),
              Space(),
              CustomTextWidget(
                index: 2,
                text: 'It will help us to know more about you!',
              ),
              Space(),
              DropdownButtonFormField<String>(
                value: selectedGender,
                items: const [
                  DropdownMenuItem(
                    value: 'Male',
                    child: Text('Male'),
                  ),
                  DropdownMenuItem(
                    value: 'Female',
                    child: Text('Female'),
                  ),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
              ),
              Space(),
              DefaultTextField(
                controller: registerControllerPage2.dateBirthController,
                prefixIcon: Icon(Icons.date_range),
                hintText: 'Date of Birth',
                onPressed: () {},
                type: TextInputType.text,
              ),
              Space(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: DefaultTextField(
                      controller: registerControllerPage2.yourWeightController,
                      prefixIcon: const Icon(Icons.monitor_weight_outlined),
                      hintText: 'Your Weight',
                      onPressed: () {},
                      type: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          shadowColor: Colors.deepOrange,
                          primary: primaryLightColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                        child: Text(
                          'KG',
                          style: TextStyle(fontSize: 12),
                        )),
                  ),
                ],
              ),
              Space(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: DefaultTextField(
                      controller: registerControllerPage2.yourHeightController,
                      prefixIcon: const Icon(Icons.height),
                      hintText: 'Your Height',
                      onPressed: () {},
                      type: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          shadowColor: Colors.deepOrange,
                          primary: primaryLightColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                        child: Text(
                          'CM',
                          style: TextStyle(fontSize: 11),
                        )),
                  ),
                ],
              ),
              Space(),
              CustomButton(
                  text: 'Next >',
                  onPressed: () {
                    () => Get.to(() => RegisterScreen3());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
