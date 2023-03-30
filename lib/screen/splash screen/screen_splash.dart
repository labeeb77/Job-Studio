import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/Intro%20screen/screen_intro.dart';
import 'package:job_studio/screen/auth/login/view/screen_login.dart';
import 'package:job_studio/screen/recruiter%20side/bottom%20nav/bottom_nav_bar.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 1));
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String? accessToken = await storage.read(key: "access-token");
      String? selectRole = await storage.read(key: "role");

      if (accessToken == null) {
      } else if (selectRole == "Recruiter") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BottomNavRecruiter(),
        ));
      } else if (selectRole == "seeker") {
         Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BottomNavRecruiter(),
        ));
      }
    });
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'JobStudio',
              style: GoogleFonts.lato(
                color: themeColor,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "It's time to start living the life we've imagined.",
              style: GoogleFonts.lato(
                color: themeColor,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      )),
    );
  }

  gotoIntro(context) async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const IntroScreen(),
    ));
  }

  Future<void> openHome(context) async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => ScreenLogin(),
    ));
  }
}
