import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_studio/screen/recruiter%20side/Add%20recruiter%20profile/view/add_recruiter_profile.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/view/add_seeker_profile.dart';

import 'package:job_studio/screen/select%20role%20screen/view/widgets/selectrole_widget.dart';
import 'package:lottie/lottie.dart';



class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Lottie.asset('assets/images/NIaM6aItpn.json', height: 300),
          const SizedBox(
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 70),
            child: Text(
              'What are you looking for.. ?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // seeker
              SelectRoleWidget(
                roleText: 'I am a Seeker',
                roleImage: SvgPicture.asset(
                  'assets/images/undraw_businessman_re_mlee.svg',
                  height: 60,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddSeekerProfile(),));
                },
              ),
              // Recruiter
              SelectRoleWidget(
                roleText: "I am a Recruiter",
                roleImage: SvgPicture.asset(
                  'assets/images/undraw_selecting_team_re_ndkb.svg',
                  height: 60,
                ),
                onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddRecruiterProfile(),));
                },
              )
            ],
          ),
         
        ],
      )),
    );
  }
}
