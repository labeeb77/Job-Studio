import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';

class UpdateJobScreen extends StatelessWidget {
  const UpdateJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title:const Text("Update",style: TextStyle(color: kBlackColor),),
      ),
    );
  }
}