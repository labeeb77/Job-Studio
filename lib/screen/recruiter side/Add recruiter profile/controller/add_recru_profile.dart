import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_studio/screen/recruiter%20side/Add%20recruiter%20profile/model/profile_model.dart';
import 'package:job_studio/screen/recruiter%20side/Add%20recruiter%20profile/service/addrecruiter_servies.dart';

class AddRecrPforileProvider with ChangeNotifier {
  // text editing controllers
  final companyNameController = TextEditingController();
  final emailController = TextEditingController();
  final establishedDateController = TextEditingController();
  final countryController = TextEditingController();
  final addressController = TextEditingController();
  String? selectedDate;

  Future<void> checkAddRecruiter() async {
    final companyName = companyNameController.text.trim();
    final companyEmail = emailController.text.trim();

    final country = countryController.text.trim();
    final companyAddress = addressController.text.trim();

    final addrecruiterProfile = RecruiterProfileModel(
        companyName: companyName,
        establishedDate: selectedDate!,
        companyEmail: companyEmail,
        country: country,
        address: companyAddress);
    RecruiterProfileService().recruiterProfileServies(addrecruiterProfile);
  }

  void datePicker(context) async {
    DateTime? datePick = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDate: DateTime.now());

    selectedDate = DateFormat("yyyy-MM-dd").format(datePick!);

    notifyListeners();
  }
}
