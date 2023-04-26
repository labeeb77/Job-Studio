import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/screen/Intro%20screen/screen_intro.dart';
import 'package:job_studio/screen/recruiter%20side/privacy_policy/privacy_policy_screen.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/view/widgets/backbutton_headtext.dart';
import 'package:job_studio/screen/seeker%20side/profile_screen/controller/get_user_profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          BackButtonAndText(
              headText: "Settings",
              onTap: () {
                log("back");
                Navigator.pop(context);
              }),
          const SizedBox(
            height: 30,
          ),
          Flexible(
            child: SettingsList(
              sections: [
                SettingsSection(
                  title: const Text('Common'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: const Icon(Icons.privacy_tip_outlined),
                      title: const Text('Privacy policy'),
                      onPressed: (context) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PrivacyPolicy(),
                        ));
                      },
                    ),
                    SettingsTile.navigation(
                      leading: const Icon(Icons.feedback_outlined),
                      title: const Text('Feedback'),
                      onPressed: (context) {},
                    ),
                    SettingsTile.navigation(
                      leading: const Icon(Icons.share),
                      title: const Text('Share'),
                      onPressed: (context) {},
                    ),
                    SettingsTile.navigation(
                      leading: const Icon(Icons.logout_outlined),
                      title: const Text('Log out'),
                      onPressed: (context) {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text(
                              "Alert!",
                            ),
                            content: const Text("Are to sure to sign out"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No")),
                              TextButton(
                                  onPressed: () {
                                    Provider.of<UserProfileProvider>(context,listen: false).fetchUserProfile();
                                    storage.delete(key: "access_token");

                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const IntroScreen()),
                                        (route) => false);
                                  },
                                  child: const Text(
                                    "Yes",
                                  ))
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text("version 1.0"),
          )
        ],
      )),
    );
  }
}
