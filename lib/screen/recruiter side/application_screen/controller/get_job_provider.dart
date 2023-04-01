import 'package:flutter/foundation.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/service/get_vacancy_service.dart';

class GetJobProvider with ChangeNotifier{

  final GetJobService getJobService = GetJobService();

  List<GetJobModel>? jobs;
  bool isLoading = false;

  List<GetJobModel>? getJobs(){
    return jobs;
  }
 

  Future<void> fetchJobs()async{
    isLoading = true;
    notifyListeners();
    jobs = await getJobService.fetchjobs();
    isLoading = false;
    notifyListeners();
  }


}