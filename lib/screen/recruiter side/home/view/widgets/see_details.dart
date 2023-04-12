import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/recruiter%20side/home/controller/applied_people_provider.dart';
import 'package:job_studio/screen/recruiter%20side/home/model/appleid_job_model.dart';
import 'package:job_studio/screen/recruiter%20side/home/service/get_applied_status.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/see_resume.dart';
import 'package:provider/provider.dart';


class SeeDetails extends StatelessWidget {
  final GetAppliedPeopleModel appliedPerson;
  SeeDetails({super.key, required this.appliedPerson});

  final List<String> seekerStatus = [
    "Pending",
    "Selected",
    "Scheduled for Interview",
    "Rejected",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(color: kBlackColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                  radius: 40, child: Image.asset("assets/images/man.png")),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              appliedPerson.appliedBy.username,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(appliedPerson.appliedBy.email),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                const Text(" Date of birth :"),
                Text(appliedPerson.profile[0].dateOfBirth)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Address :",
                ),
                Text(appliedPerson.profile[0].address)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SeeResumeScreen(appliedpeople: appliedPerson),
                  ));
                },
                child: const Text("See resume")),
            const SizedBox(
              height: 30,
            ),
            const Text("Mark as",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 10,
            ),

            // status marking

            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: SizedBox(
                child: Consumer<GetAppliedJobProvider>(
                  builder: (context, provider, child) => 
                   DropdownButtonFormField(
                      hint: const Text("Mark as"),
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
                      items: seekerStatus
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (seekerStatus) async{
                        await AppliedStatus().getAppliedStatus(appliedPerson.id, seekerStatus);
                        
                        log(appliedPerson.id.toString());
                
                      }),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
