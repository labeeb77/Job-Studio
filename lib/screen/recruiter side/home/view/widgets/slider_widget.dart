import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/get_job_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:job_studio/screen/recruiter%20side/home/controller/applied_people_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_card.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetJobProvider>(context, listen: false).fetchJobs();
      //   final createdProvider =
      //     Provider.of<GetJobProvider>(context, listen: false);
      // Provider.of<GetAppliedJobProvider>(context,listen: false).fetchAppliedPeople(createdProvider.jobs![0].id);
    });
    return Consumer2<GetJobProvider, GetAppliedJobProvider>(
      builder: (context, value, value2, child) {
        return value.isLoading == true
            ? CarouselSlider.builder(
                itemCount: 3, // Display 3 placeholder slides
                itemBuilder: (context, index, realIndex) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.1,
                  aspectRatio: 2.0,
                  initialPage: 2,
                  onPageChanged: (index, reason) {},
                ),
              )
            : value.jobs == null
                ? const Text("erro getting jobs")
                : CarouselSlider.builder(
                    itemBuilder: (context, index, realIndex) {
                      final GetJobModel job = value.jobs![index];
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
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text("salary:   ${job.salary}"),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    "https://www.freepnglogos.com/uploads/spotify-logo-png/file-spotify-logo-png-4.png",
                                    height: 50,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Box(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 13),
                                      child: Text(
                                        job.type,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Box(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 13),
                                      child: Text(
                                        job.locationType,
                                        style: const TextStyle(
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
                    itemCount: value.jobs!.length,
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.95,
                      aspectRatio: 2.0,
                      initialPage: 2,
                      onPageChanged: (index, reason) {
                        value.indexId = index;
                        value2
                            .fetchAppliedPeople(value.jobs![value.indexId!].id);
                        log(index.toString());
                        log("indexid is");
                        log(value.indexId.toString());
                      },
                    ),
                  );
      },
    );
  }
}
