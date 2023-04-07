import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/controller/applied_status_provider.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/model/applied_status_model.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/view/see_applied_job.dart';
import 'package:provider/provider.dart';

class SeekerApplicationScreen extends StatelessWidget {
  const SeekerApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AppliedStatusProvider>(context, listen: false).fetchAppliedStatus();
     
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text(
          "Applied jobs",
          style: TextStyle(color: kBlackColor),
        ),
      ),
      body: SafeArea(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  children: [
            Expanded(
              child:   Consumer<AppliedStatusProvider>(
                builder: (context, value, child) => 
                 ListView.builder(
                itemBuilder: (context, index) {
                     AppliedJobStatusModel appliedJob = value.appliedJobStatus![index];
                  return Box(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title:   Text(
                            appliedJob.jobId.position,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          subtitle: Row(
                            children:  [
                              Text(appliedJob.jobId.type),
                             const SizedBox(width: 30,),
                            Text(appliedJob.jobId.locationType)
                            ],
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/google.png",
                              height: 40,
                            ),
                          ),
                          onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const SeeAppliedJobs() ,));},
                        
                        ),
                        const Divider(color: themeColor,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: MediaQuery.of(context).size.width * 0.10,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 241, 124),
                        
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: Text(appliedJob.status,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                        )
                      ],
                    ),
                  ));
                },
                itemCount: value.appliedJobStatus!.length,
                  ),
              ),
            )
                  ],
                ),
          )),
    );
  }
}
