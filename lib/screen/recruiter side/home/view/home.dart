import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/home/controller/applied_people_provider.dart';
import 'package:job_studio/screen/recruiter%20side/home/model/appleid_job_model.dart';
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
      final createProvider =
          Provider.of<GetJobProvider>(context, listen: false).jobs![0];
      Provider.of<AppliedPeopleProvider>(context, listen: false)
          .fetchAppliedPoeple(createProvider.id);
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

            const SliderWidget(),

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
            Expanded(
                child: Consumer<AppliedPeopleProvider>(
              builder: (context, value, child) {
                
                return value.appliedPeopleJob!.isEmpty
                  ? const Center(child: Text("No applied people"),)
                  : value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  :
                  ListView.builder(
                      itemBuilder: (context, index) {
                        final GetAppliedPeopleModel appliedPerson =
                            value.appliedPeopleJob![index];
                        return Box(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(appliedPerson.appliedBy.username),
                                  subtitle:  Text(appliedPerson.profile[index].address),
                                  leading: CircleAvatar(
                                    radius: 30,
                                    child: appliedPerson.profile[index].profileImage == null || index >= value.appliedPeopleJob!.length || appliedPerson.profile == null || appliedPerson.profile.isEmpty
                                    ? Image.asset("assets/images/man.png")
                                    : CircleAvatar(
                                      radius: 30,
                                      backgroundImage: Image.network(value.appliedPeopleJob![index].profile[index].profileImage).image,
                                    )
                                  )
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
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
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
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: value.appliedPeopleJob!.length,
                    );
              },
            )),
          ],
        ),
      )),
    );
  }
}
