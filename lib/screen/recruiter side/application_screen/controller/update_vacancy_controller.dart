import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/vacancy_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/create_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/service/update_vacancy_service.dart';
import 'package:provider/provider.dart';

class UpdateVacancyProvider with ChangeNotifier {

  Future<void>updateVacancyProvider(String vacancyId,context)async{
    final createVacancyProvider = Provider.of<VacancyProvider>(context,listen: false);

    final updatePosition = createVacancyProvider.positionNameController.text;
    final updateSalary = createVacancyProvider.salaryController.text;
    final updateLocationType = createVacancyProvider.selectedLocationtype;
    final updateJobType = createVacancyProvider.selectedJobType;
    final updateRequirements = createVacancyProvider.requirementsController.text;

    final updateVacancyModel = CreateVacancyModel(
      position: updatePosition,
       salary: int.parse(updateSalary),
        locationType: updateLocationType!, 
        type: updateJobType!,
         description: updateRequirements,);

         UpdateVacancyService().updateVacancyService(updateVacancyModel, vacancyId);

  }
}