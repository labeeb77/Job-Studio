import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/controller/local_provider.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/view/seeker_application.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/view/view_resume_screen.dart';
import 'package:job_studio/screen/seeker%20side/home/view/seeker_home.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

class JobApplicationScreen extends StatelessWidget {
  // final GetJobModel job;
  const JobApplicationScreen({super.key});

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
            child: Consumer<LocalProvider>(
              builder: (context, value, child) => 
               Column(
                    children: [
              // Box(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       children: [
              //         ListTile(
              //           title: Text(
              //             job.position,
              //             style: const TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.w500),
              //           ),
              //           subtitle: Row(
              //             children: [
              //               const Text("salary"),
              //               const SizedBox(
              //                 width: 15,
              //               ),
              //               Text(
              //                 "${job.salary}",
              //               ),
              //             ],
              //           ),
              //           leading: ClipRRect(
              //             borderRadius: BorderRadius.circular(20),
              //             child: Image.network(
              //               "https://www.freepnglogos.com/uploads/spotify-logo-png/file-spotify-logo-png-4.png",
              //               height: 50,
              //             ),
              //           ),
              //         ),
              //         Row(
              //           children: [
              //             const SizedBox(
              //               width: 50,
              //             ),
              //             Box(
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(
              //                     vertical: 6, horizontal: 13),
              //                 child: Text(
              //                   job.type,
              //                   style: const TextStyle(
              //                       fontSize: 12, fontWeight: FontWeight.w500),
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(
              //               width: 20,
              //             ),
              //             Box(
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(
              //                     vertical: 6, horizontal: 13),
              //                 child: Text(
              //                   job.locationType,
              //                   style: const TextStyle(
              //                       fontSize: 12, fontWeight: FontWeight.w500),
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 30,),
              const Text("Upload your resume",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              const SizedBox(height: 20,),

              value.pdfFile !=null
              ? GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ViewResumeScreen(),));
                },
                child: Box(
                  child: Row(
                    children: [
                      Image.asset("assets/images/file-upload.png",height: 40,),
                      Expanded(child: Text("${value.pdfPath}"))
                    ],
                  ),
                ),
              )
              : const SizedBox(),
              GestureDetector(
                onTap: (){
                  value.pickFile(context);
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
              const SizedBox(height: 30,),
              // Apply button
              MyButton(
                onTap: (){
                  if(value.pdfFile !=null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SeekerHomeScreen(),));
                    showSimpleNotification(
                      const Text("Job applied successfully..")
                    );
                  }
                  else{
                    toast("please upload your resume");

                  }
                },
                 buttonText: "Apply")
              
            
                    ]
                    
                  ),
            ),
          )),
    );
  }
}
