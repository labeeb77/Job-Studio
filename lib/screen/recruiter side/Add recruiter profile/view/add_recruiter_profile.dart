import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/auth/login/view/widgets/text_field_widgte.dart';
import 'package:job_studio/screen/recruiter%20side/Add%20recruiter%20profile/controller/add_recru_profile.dart';
import 'package:job_studio/screen/recruiter%20side/bottom%20nav/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class AddRecruiterProfile extends StatelessWidget {
  AddRecruiterProfile({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        title: Text(
          "Create Profile",
          style: GoogleFonts.roboto(color: kBlackColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Consumer<AddRecrPforileProvider>(
          builder: (context, value, child) => Form(
            key: formkey,
            child: Column(
              children: [
                // Add profile photo
                const SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                      child: Image.asset("assets/images/unknown_photo.png")),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Upload photo'),

                const SizedBox(
                  height: 40,
                ),

                //Name of the company
                MyTextField(
                  controller: value.companyNameController,
                  hintText: 'Name of company',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.business_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter name of company";
                    } else {
                      return null;
                    }
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                // Email
                MyTextField(
                  controller: value.emailController,
                  hintText: 'Email',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter company email";
                    } else {
                      return null;
                    }
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                //Country
                MyTextField(
                  controller: value.countryController,
                  hintText: 'Country',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.location_pin),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter country";
                    } else {
                      return null;
                    }
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                //Company address
                MyTextField(
                  controller: value.addressController,
                  hintText: 'Company Address',
                  obscureText: false,
                  prefixIcon: const Icon(Icons.list),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter company address";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: themeColor),
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
                    child: TextButton.icon(
                        onPressed: () async {
                          value.datePicker(context);
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                        label: Text(value.selectedDate ?? "Eshtablished date")),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //Button
                Consumer<AddRecrPforileProvider>(
                  builder: (context, value, child) => MyButton(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          final result = value.checkAddRecruiter();
                          log(result.toString());
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                       BottomNavRecruiter()),
                              (route) => false);
                        }
                      },
                      buttonText: "CONFIRM"),
                ),

                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
