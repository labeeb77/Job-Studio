import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
  File? galleryImage;
  File? galleryImagePath;
  File? pdfFile;
  File? pdfPath;

  Future createSeekerProfile(context) async {
    final address = addressController.text.trim();
    final occupation = occupationController.text.trim();

    final createSeeker = SeekerProfileModel(
        dateOfBirth: selectDateOfBirth!,
        address: address,
        occupation: occupation,
        profileImage:
            Provider.of<FirebaseProvider>(context, listen: false).fileUrl);

    SeekerProfileService().seekerProfileService(createSeeker);
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

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        final imageTemp = File(image.path);
        galleryImage = imageTemp;
        galleryImagePath = File(image.name);
        notifyListeners();
        storage
            .uploadToFirebase(
                galleryImage!.path, galleryImagePath.toString(), "Images")
            .then((value) => log("image uploaded to firebase"));
      }
    } on PlatformException catch (e) {
      log("failed to pick image: $e");
    }
  }

 


}
