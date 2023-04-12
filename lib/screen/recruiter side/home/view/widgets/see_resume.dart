import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/controller/local_provider.dart';
import 'package:job_studio/screen/recruiter%20side/home/controller/applied_people_provider.dart';
import 'package:job_studio/screen/recruiter%20side/home/model/appleid_job_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SeeResumeScreen extends StatelessWidget {
  final GetAppliedPeopleModel appliedpeople;
  const SeeResumeScreen({super.key,required this.appliedpeople});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text("Resume",style: TextStyle(color: kBlackColor),),
      ),
      body: SizedBox(
       child: SfPdfViewer.network(appliedpeople.resume),
        ),
    );
  }
}