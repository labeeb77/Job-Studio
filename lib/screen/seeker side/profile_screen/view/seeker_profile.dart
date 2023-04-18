import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:job_studio/core/colors.dart';

import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/view/widgets/backbutton_headtext.dart';
import 'package:job_studio/screen/seeker%20side/profile_screen/view/settings_screen.dart';
import 'package:job_studio/screen/seeker%20side/profile_screen/view/widget/profile_box.dart';
import 'package:provider/provider.dart';

import '../controller/get_user_profile_provider.dart';

class SeekerProfile extends StatelessWidget {
  const SeekerProfile({super.key});
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProfileProvider>(context, listen: false)
          .fetchUserProfile();
    });
    return Scaffold(
      body: SafeArea(
        child: Consumer<UserProfileProvider>(
          builder: (context, value, child) {
            if (value.userProfiles == null) {
              value.fetchUserProfile();
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButtonAndText(headText: "Profile", onTap: () {
                        
                      }),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen(),)),
            
            child: Padding(
              padding: const EdgeInsets.only(top: 10,right: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.menu,
                    size: 35,
                    color: themeColor,
                  ),
                ),
              ),
            ),
          ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 45   ,
                    child: ClipOval(

                      child: Image.network(
                        value.userProfiles![0].profile.profileImage, ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "User name",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileBox(child: Text(value.userProfiles![0].username)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileBox(child: Text(value.userProfiles![0].email)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Date of birth",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileBox(
                          child: Text(
                        DateFormat('dd-MMMM-yyyy')
                            .format(value.userProfiles![0].profile.dateOfBirth),
                      
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Address",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileBox(
                          child: Text(value.userProfiles![0].profile.address)),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
