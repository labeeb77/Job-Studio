import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Terms & Conditions",
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
                'Welcome to our job portal application! Please carefully read and agree to the following terms and conditions before using our services'),
            SizedBox(
              height: 10,
            ),
            Text(
                'Use of our Services: By using our job portal application, you agree to comply with our terms and conditions, as well as any other applicable laws and regulations. You must use our services only for lawful purposes and in a manner consistent with these terms.'),
            SizedBox(
              height: 10,
            ),
            Text(
                'Account Creation: To use our services, you may need to create an account with us. You agree to provide accurate and complete information when creating your account and to keep your login credentials confidential. You are responsible for all activities that occur under your account'),
            SizedBox(
              height: 10,
            ),
            Text(
                'Content Submission: By submitting your resume, cover letter, or any other materials to our job portal application, you grant us the right to use, reproduce, and distribute the content for the purpose of matching you with potential employers. You represent and warrant that you have the right to grant us these rights and that the content you submit does not violate any third-party rights or applicable laws.'),
            SizedBox(
              height: 10,
            ),
            Text(
                'Employer Communication: By submitting your application to a job posting on our platform, you agree to allow potential employers to contact you through our messaging system. You are solely responsible for any communication that takes place between you and potential employers.'),
            SizedBox(
              height: 10,
            ),
            Text(
                'Prohibited Activities: You are prohibited from using our job portal application for any unlawful purposes, including but not limited to: distributing spam or unsolicited messages, interfering with the functioning of the application, or attempting to gain unauthorized access to our systems.'),
            SizedBox(
              height: 10,
            ),
            Text(
                'User Content: Our job portal application may allow you to post content, such as comments or reviews. You agree not to post any content that is defamatory, infringing, or otherwise unlawful. You grant us the right to remove any content that violates these terms or our policies'),
            SizedBox(
              height: 10,
            ),
            Text(
                'Limitation of Liability: We make no warranties or guarantees regarding the accuracy or completeness of the information provided by potential employers or job seekers on our platform. We are not responsible for any damages or losses that result from your use of our services'),
            SizedBox(
              height: 10,
            ),
            Text(
                'Modifications: We reserve the right to modify these terms and conditions at any time without prior notice. Your continued use of our job portal application following any changes to these terms constitutes your acceptance of such changes.')
          ],
        ),
      )),
    );
  }
}
