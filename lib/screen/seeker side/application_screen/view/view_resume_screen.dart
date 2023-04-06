import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/controller/local_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewResumeScreen extends StatelessWidget {
  const ViewResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text("Resume",style: TextStyle(color: kBlackColor),),
      ),
      body: Consumer<LocalProvider>(
        builder: (context, value, child) => 
         SizedBox(
          child: SfPdfViewer.file(value.pdfFile!),
        ),
      ),
    );
  }
}