import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';

class JobApplicationScreen extends StatelessWidget {
  const JobApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title:const Text("Job Application",style: TextStyle(color: kBlackColor),),
      ),
      body: SafeArea(child: Column(
        children: const [
          
        ],
      )),
    );
  }
}