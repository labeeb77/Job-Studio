import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final Widget prefixIcon;
  final String? Function(String?)? validator;
  final bool hasSuffixIcon;
  final bool hasPrifixicon;
  final Widget suffixIcon;

  const MyTextField({
    super.key,
     this.controller ,
    required this.hintText,
    required this.obscureText,
    this.prefixIcon = const SizedBox(),
    this.hasPrifixicon = false,
    this.validator,
    this.hasSuffixIcon = false, // default to false
    this.suffixIcon = const SizedBox(), // default to an empty SizedBox
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
       
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: themeColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: themeColor,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: themeColor),
            borderRadius: BorderRadius.circular(25),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: themeColor),
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: hasSuffixIcon ? suffixIcon : const SizedBox(),
        ),
      ),
    );
  }
}
