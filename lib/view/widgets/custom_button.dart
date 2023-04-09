import 'package:fitness_tracker/view/widgets/colors.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 99.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
        child: Container(
            height: screenHeight * 0.07,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.deepOrange,
                primary: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            )));
  }
}
