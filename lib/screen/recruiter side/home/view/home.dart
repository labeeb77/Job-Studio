import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/recruiter%20side/home/controller/applied_people_provider.dart';
import 'package:job_studio/screen/recruiter%20side/home/model/appleid_job_model.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/see_details.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/slider_widget.dart';
import 'package:provider/provider.dart';

import '../../application_screen/controller/get_job_provider.dart';

class RecruiterHomeScreen extends StatelessWidget {
  const RecruiterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetJobProvider>(context, listen: false).fetchJobs();
      // final createdProvider =
      //     Provider.of<GetJobProvider>(context, listen: false);
      // Provider.of<GetAppliedJobProvider>(context, listen: false)
      //     .fetchAppliedPeople(createdProvider.jobs![0].id);
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
                                  return Box(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                              title: Text(appliedPerson
                                                  .appliedBy.username),
                                              subtitle: Text(appliedPerson
                                                  .appliedBy.email),
                                              leading: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                      appliedPerson.profile[0]
                                                          .profileImage))),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    SeeDetails(
                                                        appliedPerson:
                                                            appliedPerson),
                                              ));
                                            },
                                            splashColor: themeColor,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: themeColor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 6,
                                                    horizontal: 50),
                                                child: Text("See Details"),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
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
