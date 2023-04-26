import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/application.dart';
import 'package:job_studio/screen/recruiter%20side/bottom%20nav/bottomnav_controller.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/home.dart';
import 'package:job_studio/screen/recruiter%20side/profile%20screen/view/recuiter_profile.dart';
import 'package:job_studio/screen/seeker%20side/chat_screen/view/seeker_chat.dart';

import 'package:provider/provider.dart';

class BottomNavRecruiter extends StatelessWidget {
   BottomNavRecruiter({super.key});

  final screens =  [
    const RecruiterHomeScreen(),
    const RecruiterApplicScreen(),
    RecruiterChatScreen(),
    const RecruiterProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[Provider.of<BottomControllerRecruiter>(context).index],
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
          child: Consumer<BottomControllerRecruiter>(
            builder: (context, value, child) => NavigationBar(
                selectedIndex: value.index,
                onDestinationSelected: (index) => value.changingIndex(index),
                destinations: const [
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
