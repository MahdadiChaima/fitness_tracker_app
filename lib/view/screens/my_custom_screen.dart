import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';
import '../widgets/space.dart';
class MyCustomScreen extends StatelessWidget {

  final String image;

  MyCustomScreen({ required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextWidget(index: 1,text:'What is your goal ?' ),
          Space(),
          CustomTextWidget(index: 2,text:'It will help us to choose a best program for you' ),
          Space(),
          Image.asset(image),
        ],
      ),
    );
  }
}
