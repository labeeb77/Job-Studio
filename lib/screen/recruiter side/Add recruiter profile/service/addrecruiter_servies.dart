import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/recruiter%20side/Add%20recruiter%20profile/model/profile_model.dart';

class RecruiterProfileService{
  Dio dio= Dio();
   
   Future<void>recruiterProfileServies(RecruiterProfileModel model)async{
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token =await storage.read(key: "access_token");
    String path = ApiConfig.apiBaseUrl + ApiConfig.recruiterProfile;
    try{
      Response response = await dio.post(path,data: model.toJson(),options: Options(headers: {"authorization": "Bearer $token"}));

      if(response.statusCode == 200 ||response.statusCode ==201){
        log(response.data.toString());
      }
    }on DioError catch(e){
      log("dio error occure in Add recruiter profile");
      log("${e.message}");
    }

    
   }
}