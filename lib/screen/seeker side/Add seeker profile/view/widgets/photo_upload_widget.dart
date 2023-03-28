import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/controller/provider.dart';
import 'package:provider/provider.dart';

class PhotoUploadWidget extends StatelessWidget {
  const PhotoUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Container(
        height: MediaQuery.of(context).size.width - 250,
        width: MediaQuery.of(context).size.width - 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(180),
          image: DecorationImage(
              image: FileImage(
                context.watch<ProfileProvider>().photo,
              ),
              fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: themeColor, borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                  onPressed: () async {
                    await getImage(context);
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: kWhiteColor,
                  ))),
        ),
      ),
    );
  }
  // Function for Upload Photo

  Future<void> getImage(context) async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (photo == null) {
      log('image is null');
      return;
    } else {
      log('image not null');
      final photoTemp = File(photo.path);
      Provider.of<ProfileProvider>(context, listen: false).setPhoto(photoTemp);
    }
  }
}
