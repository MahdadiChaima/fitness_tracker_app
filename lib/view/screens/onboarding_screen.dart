import 'package:fitness_tracker/presenter/controller/onboarding_controller.dart';
import 'package:fitness_tracker/view/screens/register/register_screen_1.dart';
import 'package:fitness_tracker/view/screens/started_screen.dart';
import 'package:fitness_tracker/view/widgets/on_boarding_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/view/widgets/colors.dart';
import 'package:get/get.dart';

import '../../presenter/service/cache_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingController _controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: (int page) {
                _controller.setCurrentPage(page);
              },
              itemCount: _controller.onBoardingItems.length,
              itemBuilder: (BuildContext context, int index) {
                return OnBoardingItemWidget(
                  item: _controller.onBoardingItems[index],
                );
              },
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _controller.onBoardingItems.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: _controller.currentPage.value == index
                            ? primaryColor
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            GetBuilder<OnBoardingController>(
              init: OnBoardingController(),
              builder: (controller) {
                return controller.isLastPage.isTrue
                    ? Positioned(
                        bottom: 37,
                        right: 20,
                        child: IconButton(
                          onPressed: () {
                            CacheHelper.saveData(
                                key: 'onBoarding', value: true);
                            Get.to(()=>RegisterScreen1());},
                          icon: Icon(
                            Icons.navigate_next,
                            size: 44,
                            color: primaryColor,
                          ),
                        ),

                      )
                    : Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
