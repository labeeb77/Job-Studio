import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
 final Function()? onTap;
 const MyButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        onTap!();
        },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
