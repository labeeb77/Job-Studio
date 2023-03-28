import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/controller/local_provider.dart';
import 'package:job_studio/screen/auth/login/view/widgets/text_field_widgte.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/view/widgets/backbutton_headtext.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/view/widgets/photo_upload_widget.dart';
import 'package:provider/provider.dart';

class AddSeekerProfile extends StatelessWidget {
  AddSeekerProfile({super.key});

  // TextEditing controllers
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final locationController = TextEditingController();
  final experienceController = TextEditingController();
  final skillsController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // Back button
            BackButtonAndText(
              headText: 'Add Profile',
              onTap: () {},
            ),
            // Add profile photo
            const SizedBox(
              height: 40,
            ),
            const PhotoUploadWidget(),
            const SizedBox(
              height: 20,
            ),
            const Text('Upload photo'),

            const SizedBox(
              height: 40,
            ),

            //Full name
            MyTextField(
              controller: fullnameController,
              hintText: 'Full name',
              obscureText: false,
              prefixIcon: const Icon(Icons.person),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),

            // Email
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              prefixIcon: const Icon(Icons.email_outlined),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),

            //Mobile
            MyTextField(
              controller: mobileController,
              hintText: 'Mobile',
              obscureText: false,
              prefixIcon: const Icon(Icons.phone_android_outlined),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),

            //Current Location
            MyTextField(
              controller: locationController,
              hintText: 'Current location',
              obscureText: false,
              prefixIcon: const Icon(Icons.location_on_outlined),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),

            // experience
            MyTextField(
              controller: experienceController,
              hintText: 'Experience',
              obscureText: false,
              prefixIcon: const Icon(Icons.list),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),

            // Key Skills
            MyTextField(
              controller: skillsController,
              hintText: 'Key Skills',
              obscureText: false,
              prefixIcon: const Icon(Icons.list),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // PDF file upload

            Consumer<LocalProvider>(
              builder: (context, value, child) => 
               ElevatedButton.icon(
                onPressed: () async{
                  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
                  if(result !=null){
                    File file = File(result.files.single.path!);
                    value.setSelectedFile(file);
                  }
                },
                icon: const Icon(Icons.cloud_download_rounded),
                label: const Text("Select PDF"),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: themeColor)))),
              ),
            )
          ],
        ),
      )),
    );
  }
}
