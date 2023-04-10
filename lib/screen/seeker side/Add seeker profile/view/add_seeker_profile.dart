import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/auth/login/view/widgets/text_field_widgte.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/controller/image_provider.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/controller/provider.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/view/widgets/backbutton_headtext.dart';
import 'package:provider/provider.dart';

class AddSeekerProfile extends StatelessWidget {
  AddSeekerProfile({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Consumer2<PickImageProvider,ProfileProvider>(
          builder: (context, value1,value2, child) => Form(
            key: formKey,
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
                GestureDetector(
                  onTap: () {
                    value1.pickImage();
                  },
                  child: CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: value1.galleryImage == null
                          ? Image.asset("assets/images/unknown_photo.png")
                          : Image.file(value1.galleryImage!,
                              width: 150, height: 150, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Upload photo'),

                const SizedBox(
                  height: 40,
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: themeColor),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 5),
                    child: TextButton.icon(
                      onPressed: ()async{
                        value2.pickDate(context);
                      },
                       icon: const Icon(Icons.calendar_month_outlined),
                        label: Text(value2.selectDateOfBirth ?? "Date of birth")),
                  ),
                ),
               
                const SizedBox(
                  height: 20,
                ),

                // Email
                MyTextField(
                  controller: value2.addressController,
                  hintText: 'Address',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your address";
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
                  controller: value2.occupationController,
                  hintText: 'Occupation',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.phone_android_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your occupation";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),

                MyButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final result = value2.createSeekerProfile(context);
                        log(result.toString());
                      }
                    },
                    buttonText: "CREATE PROFILE")
              ],
            ),
          ),
        ),
      )),
    );
  }
}
