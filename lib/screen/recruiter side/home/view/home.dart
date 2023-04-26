import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/home/controller/applied_people_provider.dart';
import 'package:job_studio/screen/recruiter%20side/home/model/appleid_job_model.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/applied_people_widget.dart';
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

            const SliderWidget(),

            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Recent people applied",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: Consumer<GetAppliedJobProvider>(
              builder: (context, value, child) {
                return value.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : value.appliedPeople == null
                        ? const Center(
                            child: Text("No People found"),
                          )
                        : value.appliedPeople!.isEmpty
                            ? const Center(
                                child: Text('No Appplied people found'))
                            : ListView.builder(
                                itemBuilder: (context, index) {
                                  final GetAppliedPeopleModel appliedPerson =
                                      value.appliedPeople![index];
                                  log(appliedPerson.appliedBy.username);
                                  return AppliedPeopleWidget(appliedPerson: appliedPerson,);
                                },
                                itemCount: value.appliedPeople!.length,
                              );
              },
            )),
          ],
        ),
      )),
    );
  }
}
