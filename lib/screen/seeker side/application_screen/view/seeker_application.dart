import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';

class SeekerApplicationScreen extends StatelessWidget {
  const SeekerApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Box(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            "Mohammed Labeeb",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          subtitle: const Text("fullstack developer"),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/man.png",
                              height: 60,
                            ),
                          ),
                        ),
                        const Divider(color: themeColor,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: MediaQuery.of(context).size.width * 0.10,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 241, 241, 124),
                        
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: Text("Pending",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                        )
                      ],
                    ),
                  ));
                },
              ),
            )
                  ],
                ),
          )),
    );
  }
}
