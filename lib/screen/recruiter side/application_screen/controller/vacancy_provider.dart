import 'package:flutter/material.dart';

class VacancyProvider with ChangeNotifier{
   final positionNameController = TextEditingController();
  final salaryController = TextEditingController();
  final requirementsController = TextEditingController();
  String? selectedLocationtype;
  String? selectedJobType;
}