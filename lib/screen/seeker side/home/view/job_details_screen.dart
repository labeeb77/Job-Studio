import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/view/job_apply_screen.dart';

class JobDetailsScreen extends StatelessWidget {
  final GetJobModel job;
  const JobDetailsScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    log(job.id);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Job Details",
          style: TextStyle(color: kBlackColor),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: themeColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                  const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://www.freepnglogos.com/uploads/spotify-logo-png/file-spotify-logo-png-4.png",
                  height: 75,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              job.position,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              job.locationType,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Job type"),
                Text(
                  job.type,
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Salary"),
                Text(
                  "${job.salary}",
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
              ],
            ),
          ),
        ),
          const Padding(
            padding: EdgeInsets.only(right: 200),
            child: Text(
              "Requirements :-",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                job.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          MyButton(onTap: () {}, buttonText: "SENT MESSAGE"),
          const SizedBox(
            height: 20,
          ),
          MyButton(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  JobApplicationScreen(
                    job: job,
                  ),
                ));
              },
              buttonText: "APPLY NOW"),
        ],
      )),
    );
  }
}
