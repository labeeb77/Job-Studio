

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/service/get_vacancy_service.dart';

class GetJobProvider with ChangeNotifier{

  final GetJobService getJobService = GetJobService();

  List<GetJobModel>? jobs;
  int? indexId = 0;
  bool isLoading = false;
 

  Future<void> fetchJobs()async{
    isLoading = true;
    notifyListeners();
    final getService = GetJobService();
    await getService.fetchjobs().then((value) {
      jobs = value;
    notifyListeners();
     isLoading = false;
     notifyListeners();
     
    });
    isLoading = false;
    notifyListeners();
  }

  // Future <void> getJobs ()async{
  //   Dio dio = Dio();
  //   String? path = ApiConfig.apiBaseUrl + ApiConfig.login;
    

  //   await dio.post(
  //     path,data: {
  //       "userName":"labeeb"
  //       "password": "12345"
  //     }
  //   );
  // }


}
