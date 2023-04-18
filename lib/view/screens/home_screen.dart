import 'package:flutter/material.dart';

import '../widgets/colors.dart';
import '../widgets/custom_text.dart';
import '../widgets/space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        index: 2,
                        text: 'Welcome Back,',
                      ),
                      CustomTextWidget(
                        index: 1,
                        text: 'Ana',
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){},
                    child: Image.asset('assets/images/man.png'),
                  ),
                ],
              ),
              Space(),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: primaryLightColor,
                ),
                child:GestureDetector(
                  onTap: (){},
                  child:const Icon(Icons.search,color: Colors.white,),
                ),
              ),
              Space(),
              Stack(
                children: [
                  Image.asset('assets/images/bmi.png'),
                  Positioned(
                    top: 60,
                    left: 25,
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(index:9 ,text:'You have a normal weight' ),
                                SizedBox(height: 20,),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryLightColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50), // button border radius
                                    ),
                                  ),
                                  child: const Text('Calculate'),
                                ),
                              ],
                            ),
                            const SizedBox(width: 110,),
                          ],
                        ),
                        const Positioned(top: 10,
                          right: 40,
                          child: CircularProgressIndicator(
                            value: 0.25, // the value of the progress indicator (between 0.0 and 1.0)
                            strokeWidth: 100, // the width of the progress indicator
                            backgroundColor: Colors.transparent, // the background color of the progress indicator
                            valueColor: AlwaysStoppedAnimation<Color>(primaryColor), // the color of the progress indicator

                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              CustomTextWidget(index:1 ,text: 'Activity Status',),




            ],
          ),
        ),
      ),
    );
  }
}
