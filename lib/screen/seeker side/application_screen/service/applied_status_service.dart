import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/model/applied_status_model.dart';

class AppliedStatusService {
  Dio dio = Dio();
  Future<List<AppliedJobStatusModel>?> fetchAppliedStatus() async{
     FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    
    String? accessToken = token!.replaceAll('"', '') ;
    String? path = ApiConfig.apiBaseUrl + ApiConfig.appliedStatus;

    try{
      Response response = await dio.get(path,
       options: Options(headers: {"authorization": "Bearer $accessToken"}));
       if(response.statusCode == 200){
        log(response.data.toString());
        log("entered to try");

      final List<AppliedJobStatusModel> appliedStatus = 
      (response.data as List).map((e) => AppliedJobStatusModel.fromJson(e)).toList();
      log(appliedStatus.toString());
      
      return appliedStatus;
       }
    }
    on DioError catch (e){
      log("error getting applied status");
      log("${e.message}");
    }
    return null;
  }
}