import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            height: 50,
          ),
        // border
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: themeColor),
            borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 30),
            child: Column(
              children: [
                  SizedBox(
              width: 300,
              height: 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(" Email :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      Text(appliedPerson.appliedBy.email,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(" Date of birth :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                      Text(DateFormat('dd-MMMM-yyyy')
                          .format(appliedPerson.profile[0].dateOfBirth),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Address :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)
                      ),
                      Text(appliedPerson.profile[0].address,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500))
                    ],
                  ),
                ],
              ),
            ),
          
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SeeResumeScreen(appliedpeople: appliedPerson),
                  ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: themeColor,
                    border: Border.all(color: themeColor,width: 2),
                    borderRadius: BorderRadius.circular(14)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                  child: Text("See Resume",style: TextStyle(color: kWhiteColor),),
                ),
              ),
            ),
              ],
            ),
          ),
        ),
        
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
                builder: (context, provider, child) => DropdownButtonFormField(
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
                    onChanged: (seekerStatus) async {
                      await AppliedStatus()
                          .getAppliedStatus(appliedPerson.id, seekerStatus);

                      log(appliedPerson.id.toString());
                    }),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
