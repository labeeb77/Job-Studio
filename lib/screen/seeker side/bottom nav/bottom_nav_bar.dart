import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/recruiter%20side/bottom%20nav/bottomnav_controller.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/view/chat.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/view/seeker_application.dart';
import 'package:job_studio/screen/seeker%20side/explore/view/explore_screen.dart';
import 'package:job_studio/screen/seeker%20side/home/view/seeker_home.dart';
import 'package:job_studio/screen/seeker%20side/profile_screen/view/seeker_profile.dart';
import 'package:provider/provider.dart';

class BottomNavSeeker extends StatelessWidget {
   BottomNavSeeker({super.key});

  final screens =  [
    const ExploreScreen(),
    const SeekerHomeScreen(),
    const SeekerApplicationScreen(),
    SeekerChatScreen(),
    const SeekerProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[Provider.of<BottomControllerSeeker>(context).index],
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: kGreyColor,
            iconTheme: MaterialStateProperty.all(
              const IconThemeData(
                color: themeColor,
                size: 24,
              ),
            ),
          ),
          child: Consumer<BottomControllerSeeker>(
            builder: (context, value, child) => NavigationBar(
                selectedIndex: value.index,
                onDestinationSelected: (index) => value.changingIndex(index),
                destinations: const [
                   NavigationDestination(icon: Icon(Icons.tour), label: 'Explore'),
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(
                      icon: Icon(Icons.list_alt_sharp), label: 'Application'),
                  NavigationDestination(
                      icon: Icon(Icons.mark_chat_unread_rounded),
                      label: 'Chat'),
                  NavigationDestination(
                      icon: Icon(Icons.person_2_rounded), label: 'Profile')
                ]),
          )),
    );
  }
}
