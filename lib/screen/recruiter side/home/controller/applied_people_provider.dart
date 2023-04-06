import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/home/model/appleid_job_model.dart';
import 'package:job_studio/screen/recruiter%20side/home/service/get_applied_job_service.dart';

class AppliedPeopleProvider with ChangeNotifier {
  

  List<GetAppliedPeopleModel>? appliedPeopleJob ;
  bool isLoading = false;



Future<void> fetchAppliedPoeple(String jobId) async{
  isLoading = true;
  notifyListeners();

  final service = GetAppliedJobService();
  appliedPeopleJob = await service.fetchAppliedPoeple(jobId);

  isLoading = false;
  notifyListeners();
}


}
