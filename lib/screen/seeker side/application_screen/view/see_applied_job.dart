import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';

import 'package:job_studio/screen/seeker%20side/application_screen/model/applied_status_model.dart';

class SeeAppliedJobs extends StatelessWidget {
 final AppliedJobStatusModel jobStatus;
  const SeeAppliedJobs({super.key,required this.jobStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Applied jobs",style: TextStyle(color: kBlackColor),),
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
         children: [
           Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Container(
            height: MediaQuery.of(context).size.width *1.5,
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
              jobStatus.jobId.position,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              jobStatus.jobId.locationType,
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
                  jobStatus.jobId.type,
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
                  "${jobStatus.jobId.salary}",
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 170),
              child: Text("Requirments :-",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                width: double.infinity,
                child: Text(jobStatus.jobId.description ,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
            )

              ],
            ),
          ),
        ),
         ],

      )),
    );
  }
}