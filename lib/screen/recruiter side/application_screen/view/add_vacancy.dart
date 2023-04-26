import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/auth/login/view/widgets/text_field_widgte.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/get_job_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/update_vacancy_controller.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/vacancy_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/bottom%20nav/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class AddVacancyScreen extends StatelessWidget {
 final String? vacancyId;
 final int index;
  AddVacancyScreen({super.key,required this.vacancyId,required this.index});
  final formkey = GlobalKey<FormState>();
  final List<String> locationType = ["onsite", "remote", "hybrid"];
  final List<String> jobType = ["full-time", "part-time", "freelance"];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final createProvider = Provider.of<VacancyProvider>(context,listen: false);
      final getCreatedVacancy = Provider.of<GetJobProvider>(context,listen: false);

      if(vacancyId != null){
        getCreatedVacancy.fetchJobs();
        createProvider.positionNameController = TextEditingController(text: getCreatedVacancy.jobs![index].position);
        createProvider.salaryController = TextEditingController(text: "${getCreatedVacancy.jobs![index].salary}");
        createProvider.selectedLocationtype = getCreatedVacancy.jobs![index].locationType;
        createProvider.selectedJobType = getCreatedVacancy.jobs![index].type;
        createProvider.requirementsController = TextEditingController(text: getCreatedVacancy.jobs![index].description);
      }
      else{
        createProvider.clearTextField();
      }

    });
    return Scaffold(
        resizeToAvoidBottomInset : false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
        title:  Text(
          vacancyId != null ? "Update Vacancy" : "Create Vcancy",
          style: const TextStyle(color: kBlackColor),
        ),
      ),
      body: SafeArea(
          child: Consumer2<VacancyProvider,GetJobProvider>(
        builder: (context, value,value2, child) => Form(
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
                prefixIcon: const Icon(Icons.note_alt_rounded),
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
                prefixIcon: const Icon(Icons.attach_money_sharp),
                obscureText: false,
                keyboardType: TextInputType.number,
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
                padding: const EdgeInsets.only(left: 24, right: 24),
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
                      items: locationType
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (selectedLocation) {
                        value.selectedLocationtype = selectedLocation;
                      }),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //job type
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
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
                      items:
                          jobType.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (selectedJobType) {
                        value.selectedJobType = selectedJobType;
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
                maxLines: 4,
                minLines: 1,
                prefixIcon: const Icon(Icons.description),
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
                    onTap: () async{
                      if (formkey.currentState!.validate()) {
                          final getCreatedVacancy = Provider.of<GetJobProvider>(context,listen: false);
                        vacancyId != null?
                           Provider.of<UpdateVacancyProvider>(context,listen: false).updateVacancyProvider(getCreatedVacancy.jobs![index].id, context)
                           : Provider.of<VacancyProvider>(context,listen: false).createVacancy();
                            
                          
                         
                          
                          List<GetJobModel>? jobs =  Provider.of<GetJobProvider>(context,listen: false).jobs;
                          if(jobs !=null){
                            log(jobs.toString());
                          }else{
                            log("Failed to get jobs");
                          }
                            
                            
                             Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BottomNavRecruiter()));
                      }
                    },
                    buttonText: vacancyId != null?"Update" : "Submit"),
              
            ],
          ),
        ),
      )),
    );
  }
}
