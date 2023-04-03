import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/view/job_apply_screen.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 20,),
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
          const SizedBox(height: 20,),
          const Text("Flutter Developer",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
          const SizedBox(height: 5,),
          const Text("kerala,India"),
          const SizedBox(height: 30,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
          Text("Job type"),
            Text("Full-time"),
         ],),
         const SizedBox(height: 20,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
          Text("Salary"),
            Text("5-7 LPA"),
         ],),
         const SizedBox(height: 30,),
         const Padding(
           padding: EdgeInsets.only(right: 200),
           child: Text("Requirements :-",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
         ),
         const SizedBox(height: 15,),
         const Padding(
           padding: EdgeInsets.only(left: 20,right: 20),
           child: Text("3+ years knowledge in mobile app development. In depth understanding of front end languages like HTML, CSS3 and JavaScript. In depth understanding of Object Oriented programming languages like Java and C++. Familiarity using version control tools like Git, Subversion et"),
         ),
         const SizedBox(height: 60,),
         MyButton(onTap: (){},
          buttonText: "SENT MESSAGE"),
           const SizedBox(height: 20,),
         MyButton(onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JobApplicationScreen(),));
         },
          buttonText: "APPLY NOW"),

        ],
      )),
    );
  }
}
