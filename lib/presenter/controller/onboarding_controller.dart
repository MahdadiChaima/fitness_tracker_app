import 'package:fitness_tracker/model/data/onboardingitem_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var currentPage = 0.obs;
  var pageController = PageController(initialPage: 0);
  var isLastPage = false.obs;
  List<OnBoardingItem> onBoardingItems = const [
    OnBoardingItem(
      title: "Track Your Goal",
      subTitle:
      "Set and track your fitness goals with our easy-to-use interface.",
      imageUrl: "assets/images/onBoarding_1.png",
    ),
    OnBoardingItem(
      title: "Get Burn",
      subTitle:
      "Achieve your desired weight by following our personalized workout plans.",
      imageUrl: "assets/images/onBoarding_2.png",
    ),
  ];
  @override
  void onInit() {
    super.onInit();
    currentPage.listen((value) {
      if (value == onBoardingItems.length - 1) {
        isLastPage.value = true;
      } else {
        isLastPage.value = false;
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void setCurrentPage(int page) {
    currentPage.value = page;
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutCirc,
    );
  }
}