import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:job_studio/screen/seeker%20side/home/view/job_details_screen.dart';

class SeekerHomeScreen extends StatelessWidget {
  const SeekerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 27,
                    child: ClipOval(
                        child: Image.asset(
                      "assets/images/userProfile.jpg",
                      fit: BoxFit.fill,
                      width: 70,
                    )),
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
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const CupertinoSearchTextField(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 13),
              placeholder: 'Search',
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
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const JobDetailsScreen(),
                    ));
                  },
                  child: Box(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              "Flutter Developer",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Row(
                              children: const [
                                Text("London"),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "4 - 8 LPA",
                                  style: TextStyle(color: Colors.blue),
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
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
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
                  ),
                );
              },
              itemCount: 15,
            ))
          ],
        ),
      )),
    );
  }
}
