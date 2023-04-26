import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/model/model.dart';
import 'package:job_studio/screen/seeker%20side/bottom%20nav/bottom_nav_bar.dart';

class SeekerProfileService {
  Dio dio = Dio();

  Future<void> seekerProfileService(
      BuildContext context, SeekerProfileModel model) async {
    log("entered to seeker service");
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String path = ApiConfig.apiBaseUrl + ApiConfig.seekerProfile;

    try {
      Response response = await dio.post(path,
          data: model.toJson(),
          options: Options(headers: {"authorization": "Bearer $accessToken"}));
      log("try function");

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        if(context.mounted){
          Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>  BottomNavSeeker()));
        }
      }
    } on DioError catch (e) {
      log("dio error occure in Add Seeker profile");
      log("${e.message}");
    }
  }
}
