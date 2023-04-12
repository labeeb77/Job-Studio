import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/home/controller/applied_people_provider.dart';
import 'package:job_studio/screen/recruiter%20side/home/model/appleid_job_model.dart';
import 'package:provider/provider.dart';

import 'custom_card.dart';

class AppliedJobWidget extends StatelessWidget {
  const AppliedJobWidget({super.key,required this.index});
 final int index;
  @override
  Widget build(BuildContext context) {
    
    return Consumer<GetAppliedJobProvider>(
              builder: (context, value, child) {
                
                return value.appliedPeople!.isEmpty
                  ? const Center(child: Text("No applied people"),)
                  : value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  :
                  ListView.builder(
                    shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final GetAppliedPeopleModel? appliedPerson =
                            value.appliedPeople?.elementAt(index);
                            if(appliedPerson == null){
                              const SizedBox.shrink();
                            }
                            return
                         Box(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(appliedPerson!.appliedBy.username),
                                  subtitle:  Text(appliedPerson.profile[index].address),
                                  leading: CircleAvatar(
                                    radius: 30,
                                    child: 
                                     Image.asset("assets/images/man.png")
                                    // : CircleAvatar(
                                    //   radius: 30,
                                    //   backgroundImage: Image.network(value.appliedPeopleJob![index].profile[index].profileImage).image,
                                    // )
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
                      itemCount: value.appliedPeople?.length ?? 0,
                    );
              },
            );
  }
}