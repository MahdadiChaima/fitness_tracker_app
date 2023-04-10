import 'package:fitness_tracker/view/widgets/custom_text.dart';
import '../../model/data/onboardingitem_model.dart';
import 'package:flutter/material.dart';

class OnBoardingItemWidget extends StatelessWidget {
  final OnBoardingItem item;
  const OnBoardingItemWidget({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.59,
            width: screenWidth,
            child: Image.asset(
              item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
         const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomTextWidget(
              text: item.title,
              index: 1,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomTextWidget(
              text: item.subTitle,
              index: 2,
            ),
          ),
        ],
      ),
    );
  }
}
