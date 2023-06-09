import 'package:fitness_tracker/presenter/controller/register_controller.dart';
import 'package:fitness_tracker/view/screens/register/register_screen_3.dart';
import 'package:fitness_tracker/view/widgets/custom_button.dart';
import 'package:fitness_tracker/view/widgets/custom_text.dart';
import 'package:fitness_tracker/view/widgets/custom_text_field.dart';
import 'package:fitness_tracker/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/colors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
class RegisterScreen2 extends StatelessWidget {
  final RegisterController registerController =
      Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? selectedGender;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30),
          child: Form(
            key:_formKey ,
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
                  onChanged: (value) {
                    if(value=='Male'){
                      registerController.isMale.value=true ;
                    }
                    else{
                      registerController.isMale.value=false ;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                ),
                Space(),
                DefaultTextField(
                  controller: registerController.dateBirthController,
                  prefixIcon: Icon(Icons.date_range),
                  hintText: 'Date of Birth',
                  validatorFn:validateDateOfBirth ,
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime(1960),
                      maxTime: DateTime.now(),
                      onConfirm: (date) {
                        registerController.dateBirthController.text = DateFormat('yyyy-MM-dd').format(date);
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.en,
                    );
                  },
                  type: TextInputType.text,
                ),
                Space(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: DefaultTextField(
                        controller: registerController.yourWeightController,
                        prefixIcon: const Icon(Icons.monitor_weight_outlined),
                        hintText: 'Your Weight',
                        validatorFn: validateWeight,
                        onPressed: () {},
                        type: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    customButtonWeightHeight('KG'),
                  ],
                ),
                Space(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: DefaultTextField(
                        controller: registerController.yourHeightController,
                        prefixIcon: const Icon(Icons.height),
                        hintText: 'Your Height',
                        validatorFn: validateHeight,
                        onPressed: () {},
                        type: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    customButtonWeightHeight('CM'),
                  ],
                ),
                Space(),
                CustomButton(
                    text: 'Next  >',
                    onPressed: () {
                      if(_formKey.currentState!.validate()) {
                        Get.to(() => RegisterScreen3());
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
customButtonWeightHeight(String text) => Container(
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
            text,
            style: TextStyle(fontSize: 12),
          )),
    );
