import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/controller/image_provider.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/model/model.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/service/firebase.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/service/seeker_service.dart';
import 'package:provider/provider.dart';

class ProfileProvider with ChangeNotifier {
  // TextEditing controllers
  FirebaseProvider storage = FirebaseProvider();
  final addressController = TextEditingController();
  final occupationController = TextEditingController();
  String? selectDateOfBirth;

  File? pdfFile;
  File? pdfPath;

  Future createSeekerProfile(context) async {
    final address = addressController.text.trim();
    final occupation = occupationController.text.trim();

    final providerFirebase =
        Provider.of<FirebaseProvider>(context, listen: false);
    final provider2 = Provider.of<PickImageProvider>(context, listen: false);
    await providerFirebase.uploadToFirebase(provider2.galleryImage!.path,
        provider2.galleryImagePath!.path, "Images");

    final createSeeker = SeekerProfileModel(
        dateOfBirth: selectDateOfBirth!,
        address: address,
        occupation: occupation,
        profileImage:
            Provider.of<FirebaseProvider>(context, listen: false).fileUrl);

    SeekerProfileService().seekerProfileService(context, createSeeker);
    log("Entered to create seeker function");
  }

  // Date pick function
  void pickDate(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDate: DateTime.now());

    selectDateOfBirth = DateFormat("yyyy-MM-dd").format(pickedDate!);
    notifyListeners();
  }

  // Upload photo
}
