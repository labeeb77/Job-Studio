
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/slider_widget.dart';
import 'package:provider/provider.dart';

import '../../application_screen/controller/get_job_provider.dart';

class RecruiterHomeScreen extends StatelessWidget {
  const RecruiterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetJobProvider>(context, listen: false).fetchJobs();
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CupertinoSearchTextField(
              placeholder: 'Search',
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'My Vacancies',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
       // carousel slider

  const  SliderWidget(),
           
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Recent people applied",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Box(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                    child: Text('See all'),
                  ),
                )
              ], 
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: 
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return  Box(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Mohammed labeeb"),
                      subtitle: const Text("Flutter developer"),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://media.istockphoto.com/id/1200677760/photo/portrait-of-handsome-smiling-young-man-with-crossed-arms.jpg?s=612x612&w=0&k=20&c=g_ZmKDpK9VEEzWw4vJ6O577ENGLTOcrvYeiLxi8mVuo=",
                          height: 50,
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 50,
                        ),
                        Box(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 15),
                            child: Text(
                              "See detailes",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Box(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 15),
                            child: Text(
                              "See Resume",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
              },)),
           
          ],
        ),
      )),
    );
  }
}
