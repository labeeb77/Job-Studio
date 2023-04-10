import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/service/firebase.dart';

class PickImageProvider with ChangeNotifier {
FirebaseProvider storage = FirebaseProvider();
    File? galleryImage;
  File? galleryImagePath;
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
