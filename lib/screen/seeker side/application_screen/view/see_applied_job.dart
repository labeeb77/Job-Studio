import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';

class SeeAppliedJobs extends StatelessWidget {
  const SeeAppliedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Applied jobs",style: TextStyle(color: kBlackColor),),
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          

      )),
    );
  }
}