import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/get_job_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_card.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  
      Consumer<GetJobProvider>(
        builder: (context, value, child) {
          return
          value.isLoading == true
          ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: const SizedBox(
              width: double.infinity,
              height: 100,
            ),)
          : value.jobs == null
          ? const Text("erro getting jobs")
          : CarouselSlider.builder(itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            final GetJobModel job = value.jobs![index];
            return  Box(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        title:  Text(job.position ,style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),),
                        subtitle: Text("salary:   ${job.salary}"
                                ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://www.freepnglogos.com/uploads/spotify-logo-png/file-spotify-logo-png-4.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Row(
                        children:  [
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
                                    fontSize: 12, fontWeight: FontWeight.w500),
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
          },
           options: CarouselOptions(  autoPlay: false,
            enlargeCenterPage: true,
              viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,),);
        },
      );
  }
}