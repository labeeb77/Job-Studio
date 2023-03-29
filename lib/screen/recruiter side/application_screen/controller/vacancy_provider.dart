import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/create_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/service/vacancy_service.dart';

class VacancyProvider with ChangeNotifier {
  final positionNameController = TextEditingController();
  final salaryController = TextEditingController();
  final requirementsController = TextEditingController();
  String? selectedLocationtype;
  String? selectedJobType;

  Future<void> createVacancy() async {
    final positionName = positionNameController.text.trim();
    final salary = salaryController.text.trim();
    final requirements = requirementsController.text.trim();

    final createVacancyModel = CreateVacancyModel(
      position: positionName,
      salary: salary as int,
      locationType: selectedLocationtype as String,
      type: selectedJobType as String,
      description: requirements,
    );
    CreateVacancyService().createVacancyService(createVacancyModel);
  }
}
