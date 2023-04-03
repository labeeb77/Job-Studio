import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/delete_vacancy_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/get_job_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/view/add_vacancy.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/view/update_job.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class RecruiterApplicScreen extends StatelessWidget {
  const RecruiterApplicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetJobProvider>(context, listen: false).fetchJobs();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Application",
          style: TextStyle(color: kBlackColor),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const CupertinoSearchTextField(
              placeholder: 'Search',
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Consumer2<GetJobProvider, DeleteVacancyProvider>(
                    builder: (context, value, deleteProvider, child) => value
                                .isLoading ==
                            true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : value.jobs == null
                            ? const Center(
                                child: Text("Error getting jobs"),
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) {
                                  final GetJobModel job = value.jobs![index];
                                  log(job.position);

                                  return Box(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                        title: Text(
                                          job.position,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Text(job.locationType),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              "salary : ${job.salary}",
                                            ),
                                          ],
                                        ),
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            "https://www.freepnglogos.com/uploads/spotify-logo-png/file-spotify-logo-png-4.png",
                                            height: 50,
                                          ),
                                        ),
                                        trailing: PopupMenuButton<String>(
                                          itemBuilder: (BuildContext context) {
                                            return <PopupMenuEntry<String>>[
                                              const PopupMenuItem<String>(
                                                value: 'Edit',
                                                child: Text('Edit'),
                                              ),
                                              const PopupMenuItem<String>(
                                                value: 'Delete',
                                                child: Text('Delete'),
                                              ),
                                            ];
                                          },
                                          onSelected: (String value) {
                                            if (value == 'Edit') {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    const UpdateJobScreen(),
                                              ));
                                            } else if (value == 'Delete') {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title: const Text(
                                                    "Alert",
                                                  ),
                                                  content: const Text(
                                                      "Are you want to delete this vacancy ?"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text("No")),
                                                    TextButton(
                                                        onPressed: () {
                                                          Provider.of<DeleteVacancyProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .deleteVacancy(
                                                                  job.id);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text("Yes"))
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                          icon: const Icon(Icons.more_vert),
                                        )),
                                  ));
                                },
                                itemCount: value.jobs!.length,
                              ),
                  )),
            ),
            const SizedBox(
              height: 35,
            ),
            MyButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddVacancyScreen(),
                  ));
                },
                buttonText: "Add Vacancy")
          ],
        ),
      )),
    );
  }
}
