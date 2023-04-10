import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/controller/local_provider.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/get_job_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/controller/apply_job_provider.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/view/view_resume_screen.dart';
import 'package:job_studio/screen/seeker%20side/bottom%20nav/bottom_nav_bar.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

class JobApplicationScreen extends StatelessWidget {
  const JobApplicationScreen({super.key, required this.job});
  final GetJobModel job;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: const Text(
          "Job Application",
          style: TextStyle(color: kBlackColor),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer2<LocalProvider, GetJobProvider>(
          builder: (context, value1, value2, child) {
            // final GetJobModel job = value2.jobs![index];
            return Column(children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Upload your resume",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),

              value1.pdfFile != null
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ViewResumeScreen(),
                        ));
                      },
                      child: Box(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/file-upload.png",
                                height: 40,
                              ),
                              Expanded(child: Text("${value1.pdfPath}"))
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              GestureDetector(
                onTap: () {
                  value1.pickFile(context);
                },
                child: const Box(
                  child: SizedBox(
                    height: 180,
                    child: Center(
                      child: CircleAvatar(
                        radius: 40,
                        child: Icon(
                          Icons.cloud_upload_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              // Apply button
              MyButton(
                  onTap: () {
                    if (value1.pdfFile != null) {
                      Provider.of<ApplyJobProvider>(context, listen: false)
                          .applyForJob(context, job.id);
                    
                    } else {
                      toast("please upload your resume");
                    }
                  },
                  buttonText: "Apply")
            ]);
          },
        ),
      )),
    );
  }
}
