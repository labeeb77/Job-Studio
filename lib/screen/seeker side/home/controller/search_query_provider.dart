import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/service/get_vacancy_service.dart';

class JobSearchProvider with ChangeNotifier {
  List<GetJobModel>? createdJobs;
  bool isLoading = false;

  // for search

  List<GetJobModel>? createdJobSearch;

  Future<void> fetchJobs() async {
    isLoading = true;
    notifyListeners();
    final getService = GetJobService();
    await getService.fetchjobs().then((value) {
      createdJobs = value;
      createdJobSearch = value;
      notifyListeners();
      isLoading = false;
      notifyListeners();
    });
    isLoading = false;
    notifyListeners();
  }

  void runFilter(String searchedValue) {
    if (searchedValue.isEmpty) {
      createdJobSearch = createdJobs;
      notifyListeners();
    } else {
      createdJobSearch = createdJobs!
          .where((element) => element.position
              .toLowerCase()
              .contains(searchedValue.toLowerCase()))
          .toList();
      notifyListeners();
      log(createdJobSearch.toString());
    }
  }
}
