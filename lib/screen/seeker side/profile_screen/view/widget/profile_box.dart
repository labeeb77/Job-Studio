import 'package:flutter/material.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({super.key,required this.child});

 final Widget? child;


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child:  Center(
            child:child,
        ));
  }
}
