import 'package:flutter/cupertino.dart';
import 'package:job_studio/screen/seeker%20side/profile_screen/model/get_user_profile_model.dart';
import 'package:job_studio/screen/seeker%20side/profile_screen/service/get_user_profile_service.dart';

class UserProfileProvider extends ChangeNotifier {
  List<GetUserProfiledModel>? userProfiles;

  List<GetUserProfiledModel>? get getUserProfiles => userProfiles;

  set setUserProfiles(List<GetUserProfiledModel>? value) {
    userProfiles = value;
    notifyListeners();
  }

  Future<void> fetchUserProfile() async {
    final service = GetUserProfileService();
     await service.fetchUserProfile().then((value) {
      userProfiles = value;
      notifyListeners();
    });

   
  }
}