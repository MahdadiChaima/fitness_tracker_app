import 'package:fitness_tracker/presenter/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presenter/controller/login_controller.dart';
class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text('Home')),
    body:Column(
      children: [
        GetBuilder<LoginController>(
          init: LoginController(),
          builder:(controller)=> TextButton(onPressed: (){
            controller.logout();
          },child:Text('LogOut') ),
        ),

      ],
    ),

    );
  }
}
