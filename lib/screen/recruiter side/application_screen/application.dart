import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/view/add_vacancy.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';

class RecruiterApplicScreen extends StatelessWidget {
  const RecruiterApplicScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title:const Text("Application",style: TextStyle(color: kBlackColor),),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           
           const CupertinoSearchTextField(
                placeholder: 'Search',
              ),
              const SizedBox(height: 5,),
            Flexible(
              child: SizedBox(
                 height: MediaQuery.of(context).size.height * 0.55,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Box(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                              title: const Text("Flutter Developer" ,style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w500),),
                              subtitle: Row(
                                children: const [
                                  Text("London"),
                                   SizedBox(width: 15,),
                                  Text("4 - 8 LPA",style: TextStyle(
                                          color: Colors.blue),),
                        
                                ],
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "https://www.freepnglogos.com/uploads/spotify-logo-png/file-spotify-logo-png-4.png",
                                  height: 50,
                                ),
                              ),
                            ),
                      ),
                    );
                  },
                   itemCount: 10),
              ),
            ),
            const SizedBox(height: 35,),
            MyButton(onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AddVacancyScreen(),));
            },
             buttonText: "Add Vacancy")
          ],
        ),
      )),
    );
  }
}