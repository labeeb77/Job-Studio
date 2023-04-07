import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/screen_login.dart';

class SeekerProfile extends StatelessWidget {
  const SeekerProfile({super.key});
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: const Text("Profile",style: TextStyle(color: kBlackColor),),
        actions: [
          IconButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text(
                      "Alert!",
                      style: TextStyle(color: Colors.red),
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
                            storage.delete(key: "access_token");
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>  ScreenLogin()),
                                (route) => false);
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  ),
                );


          }, icon: const Icon(Icons.logout_outlined,color: themeColor,))
        ],
      ),
    );
  }
}