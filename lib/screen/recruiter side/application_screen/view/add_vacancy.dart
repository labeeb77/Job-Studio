
import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/auth/login/view/widgets/text_field_widgte.dart';
import 'package:job_studio/screen/recruiter%20side/Add%20recruiter%20profile/controller/add_recru_profile.dart';
import 'package:provider/provider.dart';

class AddVacancyScreen extends StatelessWidget {
  AddVacancyScreen({super.key});
  final formkey = GlobalKey<FormState>();
List<String> locationType = ["onsite" , "remote" , "hybrid"];
List<String> jobType = ["full-time" , "part-time" , "freelance"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text(
          "Create Vacancy",
          style: TextStyle(color: kBlackColor),
        ),
      ),
      body: SafeArea(
          child: Consumer<AddRecrPforileProvider>(
        builder: (context, value, child) =>
         Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),

              //position
              MyTextField(
                controller: value.companyNameController,
                hintText: 'Name of position',
                 prefixIcon:const Icon(Icons.note_alt_rounded),
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter name of position";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 20,
              ),

              // salary
              MyTextField(
                controller: value.emailController,
                hintText: 'Salary',
                 prefixIcon:const Icon(Icons.attach_money_sharp),
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter salary";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 20,
              ),

              //location type
            

              const SizedBox(
                height: 20,
              ),
              

              //job type
              MyTextField(
                controller: value.countryController,
                hintText: 'job type',
               prefixIcon:const Icon(Icons.type_specimen_rounded),
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter job type";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 20,
              ),

              //Requirements
              MyTextField(
                controller: value.addressController,
                hintText: 'Requirements',
                obscureText: false,
                prefixIcon:const Icon(Icons.description),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please add requirements";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 60,
              ),
              //Button
              Consumer<AddRecrPforileProvider>(
                builder: (context, value, child) => MyButton(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                       
                      }
                    },
                    buttonText: "SUBMIT"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
