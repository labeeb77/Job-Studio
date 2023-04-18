import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/recruiter%20side/profile%20screen/view/settings_screen.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/view/widgets/backbutton_headtext.dart';
import 'package:job_studio/screen/seeker%20side/profile_screen/view/widget/profile_box.dart';

class RecruiterProfile extends StatelessWidget {
  const RecruiterProfile({super.key});
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:
                // Consumer<UserProfileProvider>(
                //   builder: (context, value, child) {
                //     if (value.userProfiles == null) {
                //       value.fetchUserProfile();
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     } else {
                //       return
                Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackButtonAndText(headText: "Profile", onTap: () {}),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsRecruiter(),
              )),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
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
          radius: 45,
          child: ClipOval(
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNaRGl6-GDy8k4FTzpOTTNEBAjJSaIcKxwjcXoTU4vYw&usqp=CAU&ec=48665701"),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Company name",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ProfileBox(child: Text("Cognizent")),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ProfileBox(child: Text("inquiry@cognizant.com")),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Eshtablished date",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ProfileBox(child: Text("02 - jul - 2000")),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Company address",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ProfileBox(child: Text("office level 34 tower two")),
            SizedBox(
              height: 10,
            ),
          ],
        )
      ],
    )));
  }
}
//         ),
//       ),
//     );
//   }
// }