import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/get_job_provider.dart';
import 'package:job_studio/screen/recruiter%20side/home/model/appleid_job_model.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/see_details.dart';
import 'package:provider/provider.dart';

class AppliedPeopleWidget extends StatelessWidget {
  final GetAppliedPeopleModel appliedPerson;
  const AppliedPeopleWidget({super.key, required this.appliedPerson});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetJobProvider>(context, listen: false).fetchJobs();
    });
    return Box(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
                title: Text(appliedPerson.appliedBy.username),
                subtitle: Text(appliedPerson.appliedBy.email),
                leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(appliedPerson.profile[0].profileImage))),
            const SizedBox(
              width: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      SeeDetails(appliedPerson: appliedPerson),
                ));
              },
              splashColor: themeColor,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: themeColor),
                    borderRadius: BorderRadius.circular(20)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 50),
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
  }
}
