import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/seeker%20side/profile_screen/model/get_user_profile_model.dart';

class GetUserProfileService {
  Dio dio = Dio();
  Future<List<GetUserProfiledModel>?> fetchUserProfile() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");

    String? accessToken = token!.replaceAll('"', '');
    String? path = ApiConfig.apiBaseUrl + ApiConfig.getseekerProfile;

    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        log(response.data.toString());

        if (response.data is List) {
          final List<GetUserProfiledModel> userProfile = (response.data as List)
              .map((e) => GetUserProfiledModel.fromJson(e))
              .toList();
          log("after mapping");
          log(userProfile.toString());
          return userProfile;
        } else if (response.data is Map) {
          final List<GetUserProfiledModel> userProfile = [
            GetUserProfiledModel.fromJson(response.data)
          ];
          log("after mapping");
          log(userProfile.toString());
          return userProfile;
        } else {
          throw Exception("Invalid response data format");
        }
      }
    } on DioError catch (e) {
      log("error getting User profile");
      log("${e.message}");
    }
    return null;
  }
}
