

import 'package:flutter/material.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/model/applied_status_model.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/service/applied_status_service.dart';

class AppliedStatusProvider with ChangeNotifier {
  final AppliedStatusService applidStatusService = AppliedStatusService();
  List<AppliedJobStatusModel>? appliedJobStatus;
  bool isLoading = false;

    // getter to access the list of applied jobs
  List<AppliedJobStatusModel>? getAppliedJobs() {
    return appliedJobStatus;
    
  }

  Future<void> fetchAppliedStatus()async{
    isLoading = true;
    notifyListeners();
    List<AppliedJobStatusModel>? fetchedJobs = await applidStatusService.fetchAppliedStatus();
    if(fetchedJobs !=null){
      appliedJobStatus = fetchedJobs;
      notifyListeners();
    
    }
    isLoading = false;
    notifyListeners();
    
    
    
  }
  
}