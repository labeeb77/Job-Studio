
import 'package:flutter/cupertino.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/service/delete_job_service.dart';

class DeleteVacancyProvider with ChangeNotifier{
  final DeleteJobService service = DeleteJobService();

  Future<void> deleteVacancy (String jobId)async{
    await service.deleteVacancy(jobId);
    notifyListeners();
  }
}