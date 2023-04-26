import 'package:flutter/cupertino.dart';
import 'package:job_studio/screen/recruiter%20side/home/service/get_applied_job_service.dart';

import '../model/appleid_job_model.dart';

class GetAppliedJobProvider extends ChangeNotifier {
  List<GetAppliedPeopleModel>? appliedPeople;
  bool isLoading = false;
  String errorMessage = '';

  

  Future<void> fetchAppliedPeople(String jobId, [id]) async {
    try {
      isLoading = true;
      notifyListeners();
      
      final List<GetAppliedPeopleModel>? appliedPeople =
          await GetAppliedJobService().fetchAppliedPoepleService(jobId);
          
      this.appliedPeople = appliedPeople;
      errorMessage = '';

      isLoading = false;
      notifyListeners();
    } catch (e) {
      errorMessage = 'Failed to fetch applied people: $e';
      
      isLoading = false;
      notifyListeners();
    }
  }
}