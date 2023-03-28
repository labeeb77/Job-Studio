import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/auth/otp%20screen/controller/otp_provider.dart';
import 'package:job_studio/screen/auth/otp%20screen/view/widgets/otp_field_widget.dart';
import 'package:job_studio/screen/select%20role%20screen/view/screen_selectrole.dart';
import 'package:provider/provider.dart';

class ScreenOTP extends StatelessWidget {
  const ScreenOTP({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtpProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
              child: Text(
            'Please Enter the code \nthat was send to your ',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          )),
          const Text(
            'email',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text('Verification Code '),

          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //OTP text fields

                OtpField(
                  controller: provider.otpTextEditingController1,
                ),
                OtpField(
                  controller: provider.otpTextEditingController2,
                ),
                OtpField(
                  controller: provider.otpTextEditingController3,
                ),
                OtpField(
                  controller: provider.otpTextEditingController4,
                ),
                OtpField(
                  controller: provider.otpTextEditingController5,
                ),
                OtpField(
                  controller: provider.otpTextEditingController6,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          // verify Button
          MyButton(onTap: () async{
            final result = await provider.otpChecking(context);
            log(result);
           if(result == "success"){
              if(context.mounted){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const SelectRoleScreen(),));
              }
            }


          }, buttonText: 'VERIFY'),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Don't receive the code?",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Text(
                  'Resend Code',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SelectRoleScreen(),
                ));
              },
              child: const Text('role'))
        ],
      )),
    );
  }
}
