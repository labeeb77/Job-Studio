import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/Intro%20screen/screen_intro.dart';
import 'package:job_studio/screen/select%20role%20screen/view/screen_selectrole.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool seen = (prefs.getBool('seen') ?? false);
      // ignore: use_build_context_synchronously
      seen ? openHome(context) : gotoIntro(context);
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
            const SizedBox(height: 5,),
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
      builder: (context) => const SelectRoleScreen(),
    ));
  }
}
