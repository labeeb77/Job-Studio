
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/home/controller/applied_people_provider.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:job_studio/screen/seeker%20side/home/controller/search_query_provider.dart';
import 'package:job_studio/screen/seeker%20side/home/view/job_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SeekerHomeScreen extends StatelessWidget {
 const  SeekerHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     final jobProvider = Provider.of<JobSearchProvider>(context, listen: false);
     jobProvider.fetchJobs();
     jobProvider.createdJobs = jobProvider.createdJobSearch;
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Consumer<JobSearchProvider>(
          builder: (context, jobProvider, child) => 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<GetAppliedJobProvider>(
                      builder: (context, value, child) => 
                       CircleAvatar(
                        radius: 27,
                        child: ClipOval(
                            child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjDq8ClGhSmbjqzVntjDmqTk6iEF8Z7PJLgyARPxB_8cftKq3z35G7zRS_RuTuQMUcvfLkKz1YcHY&usqp=CAU&ec=48665701")),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Find your\nDream job ",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/notification.png'),
                      iconSize: 30,
                      onPressed: () {
                     
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CupertinoSearchTextField(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 13),
                placeholder: 'Search',
                onChanged: (query) {
                  jobProvider.runFilter(query);

              
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Recommended jobs",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(child: 
                
                
                   jobProvider.createdJobSearch == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      :   jobProvider.isLoading == true
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: ListView.builder(
                                itemBuilder: (context, index) => Box(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 100.0,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 16.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 8.0,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(height: 8.0),
                                              Container(
                                                width: double.infinity,
                                                height: 8.0,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(height: 8.0),
                                              Container(
                                                width: 40.0,
                                                height: 8.0,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                itemCount: jobProvider.createdJobSearch!.length,
                              ),
                            )
                          
                              : ListView.builder(
                                  itemBuilder: (context, index) {
                                    final GetJobModel job = jobProvider.createdJobSearch![index];
                                    if (job.position
                                        .toLowerCase()
                                        .contains(searchQuery.toLowerCase())) {
                                      return Box(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  job.position,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                subtitle: Row(
                                                  children: [
                                                    const Text("salary"),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      "${job.salary}",
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
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              JobDetailsScreen(
                                                                  job: job)));
                                                },
                                              ),
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Box(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 6,
                                                          horizontal: 13),
                                                      child: Text(
                                                        job.type,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Box(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 6,
                                                          horizontal: 13),
                                                      child: Text(
                                                        job.locationType,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                    return null;
                                  },
                                  itemCount: jobProvider.createdJobSearch!.length,
                                )
                
              )
            ],
          ),
        ),
      )),
    );
  }
}

String searchQuery = '';
