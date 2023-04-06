import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/model/applyjob_model.dart';

class ApplyJobService{
  Dio dio = Dio();

  Future<void>applyForJobService (ApplyJobModel model, String jobId)async{
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String? path = "${ApiConfig.apiBaseUrl}${ApiConfig.jobVacancy}$jobId/apply";

    try{
      Response response = await dio.post(path,data: model.toJson(),options: Options(headers: {"authorization": "Bearer $accessToken"}));
      if(response.statusCode == 200 || response.statusCode == 201){
        log(response.data.toString());
      }
    }on DioError catch(e){
      log("error in appling job");
      log("${e.message}");
    }

  }
}