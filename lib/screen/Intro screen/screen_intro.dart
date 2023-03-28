import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_studio/screen/auth/login/view/screen_login.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 130,
            ),
            Center(
                child: SvgPicture.asset(
              'assets/images/undraw_remotely_-2-j6y.svg',
              height: 220,
            )),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Text(
                    'Find Your',
                    style: GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                   const Text(
                    'Dream',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        color: Color(0xFF8b157f)),
                  ),
                   Text(
                    'Tech Job',
                    style: GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Explore all the most exciting remote jobs based on your intrest',
                      style: GoogleFonts.lato(),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  ScreenLogin(),));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(8),
                      backgroundColor: const Color(0xFF8b157f)),
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
