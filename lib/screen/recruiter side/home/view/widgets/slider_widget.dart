import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'custom_card.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    CarouselSlider.builder(itemCount: 5,
        itemBuilder: (context, index, realIndex) {
          return  Box(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Flutter Developer" ,style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),),
                      subtitle: Row(
                        children: const [
                          Text("London"),
                           SizedBox(width: 15,),
                          Text("4 - 8 LPA",style: TextStyle(
                                  color: Colors.blue),),

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
                    Row(
                      children: const [
                        SizedBox(
                          width: 50,
                        ),
                        Box(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 13),
                            child: Text(
                              "Senior developer",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Box(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 13),
                            child: Text(
                              "Full time",
                              style: TextStyle(
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
  }
}