import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';

class AppliedStatus {
  Dio dio = Dio();
  Future<void>getAppliedStatus(String jobId,seekerStatus )async{
        FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");

    String? accessToken = token!.replaceAll('"', '');
    String? path = ApiConfig.apiBaseUrl + ApiConfig.status + jobId;

    try{
      Response response = await dio.patch(path,
      options: Options(headers: {"authorization": "Bearer $accessToken"}),
      data: {"status" : "$seekerStatus"});
      if (response.statusCode == 200 || response.statusCode == 201){
        log(response.data.toString());
      }
    }
    on DioError catch(e){
      log("${e.message}");
      log("error getting status");
    }
  }

}