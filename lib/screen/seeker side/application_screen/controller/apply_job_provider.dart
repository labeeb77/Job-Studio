import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_studio/screen/auth/login/controller/local_provider.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/service/firebase.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/model/applyjob_model.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/service/apply_job_service.dart';
import 'package:provider/provider.dart';

class ApplyJobProvider with ChangeNotifier {
bool isLoading = false;
  Future<void>applyForJob (context , String jobId)async{
   final firbaseProvider  =  Provider.of<FirebaseProvider>(context,listen: false);
    final localProvider  =  Provider.of<LocalProvider>(context,listen: false);

    firbaseProvider.uploadToFirebase(localProvider.pdfFile!.path, localProvider.pdfPath!.path, "Resume");

    if(firbaseProvider.fileUrl != null){
      isLoading = true;

      final applyJobModel = ApplyJobModel(resume: firbaseProvider.fileUrl!);
      notifyListeners();
      log(" file url is${firbaseProvider.fileUrl}");

      ApplyJobService().applyForJobService(applyJobModel, jobId);
    }
    else{
      log("fileUrl is null");
    }


  }
}