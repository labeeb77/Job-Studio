import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/get_job_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/view/add_vacancy.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class RecruiterApplicScreen extends StatelessWidget {
  const RecruiterApplicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      Provider.of<GetJobProvider>(context,listen: false).fetchJobs();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
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
                child: Consumer<GetJobProvider>(
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (value.jobs == null) {
                      return const Center(
                        child: Text("Error getting jobs"),
                      );
                    } else {
                      final List<GetJobModel> allJobs = value.jobs!;
                      return ListView.builder(
                          itemBuilder: (context, index) {
                            final GetJobModel job = allJobs[index];
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
                                        job.salary.toString(),
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      ),
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
                          itemCount: allJobs.length);
                    }
                  },
                ),
              ),
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
