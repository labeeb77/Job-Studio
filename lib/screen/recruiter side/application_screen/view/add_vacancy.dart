
import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/auth/login/view/widgets/text_field_widgte.dart';
import 'package:job_studio/screen/recruiter%20side/Add%20recruiter%20profile/controller/add_recru_profile.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/vacancy_provider.dart';
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
          child: Consumer<VacancyProvider>(
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
                controller: value.positionNameController,
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
                controller: value.salaryController,
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
           Padding(
             padding: const EdgeInsets.only(left: 24,right: 24),
             child: SizedBox(
                  child: DropdownButtonFormField(
                    hint: const Text("location type"),
                    decoration: InputDecoration(
                     border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: themeColor,
              ),
                     ),
                     enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: themeColor,
              ),
              borderRadius: BorderRadius.circular(25),
                     ),
                     focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: themeColor),
              borderRadius: BorderRadius.circular(25),
                     ),
                     errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: themeColor),
              borderRadius: BorderRadius.circular(25),
                     ),
                              isDense: true,
                            ),
                    items: locationType.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(value: value,child: Text(value),);
                    }).toList(),
                     onChanged: (selectedLocation){
                      value.selectedLocationtype = selectedLocation ;
                     }),
                ),
           ),
            

              const SizedBox(
                height: 20,
              ),
              

              //job type
              Padding(
                padding: const EdgeInsets.only(left: 24,right: 24),
                child: SizedBox(
                  child: DropdownButtonFormField(
                    hint: const Text("Job type"),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                color: themeColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                color: themeColor,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: themeColor),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: themeColor),
                          borderRadius: BorderRadius.circular(25),
                        ),
                              isDense: true,
                            ),
                    items: jobType.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(value: value,child: Text(value),);
                    }).toList(),
                     onChanged: (selectedJobType){
                      value.selectedJobType = selectedJobType ;
                     }),
                ),
              ),
             

              const SizedBox(
                height: 20,
              ),

              //Requirements
              MyTextField(
                controller: value.requirementsController,
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
              MyButton(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                     value.createVacancy();

                    }
                  },
                  buttonText: "SUBMIT"),
            ],
          ),
        ),
      )),
    );
  }
}
