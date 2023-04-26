import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy",
          style: TextStyle(color: kBlackColor),
        ),
        leading: const BackButton(
          color: kBlackColor,
        ),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const [
            Text(
                'Job Studio "we or us" is commited to protecting your privacy.This Privacy Policy explains how we collect, use, and disclose your personal information when you use our job portal application (Job Studio)'),
            SizedBox(
              height: 10,
            ),
            Text('Personal Information We Collect'),
            SizedBox(
              height: 10,
            ),
            Text(
                'We may collect following personal information when you use the Application'),
            SizedBox(
              height: 10,
            ),
            Text(
                ' • Name\n • Contact information (email address, phone number, postal address)\n • Work history and Experience\n • Education information\n • Resume/ Cv information\n • Employment preferences'),
            SizedBox(
              height: 10,
            ),
            Text('We use your personal information for the following purposes'),
            SizedBox(
              height: 10,
            ),
            Text(
                ' • To create and maintain your account\n • To provide you with job recommendations and notifications\n • To match you with job opportunities and employers\n • To communicate with you about job opportunities\n • To improve our Application and services '),
            SizedBox(
              height: 10,
            ),
            Text(
                'We may disclose your personal information to the following third parties'),
            SizedBox(
              height: 10,
            ),
            Text(
                ' • Employers and recruiters who are interested in your job profile\n • Service providers who help us operate our Application and provide our services (such as hosting providers, analytics providers, and customer support providers)\n • Legal and regulatory authorities, if required by law'),
            SizedBox(
              height: 10,
            ),
            Text('Changes to this Privacy Policy'),
            SizedBox(
              height: 10,
            ),
            Text(
                'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.'),
            SizedBox(
              height: 10,
            ),
            Text(
                'If you have any questions about this Privacy Policy, please contact us at 9400638052.'),
            SizedBox(
              height: 10,
            ),
            Text(
                'By using our Application, you consent to our collection, use, and disclosure of your personal information as described in this Privacy Policy.'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
