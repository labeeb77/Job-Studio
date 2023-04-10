import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:overlay_support/overlay_support.dart';

class DeleteJobService {
  Dio dio = Dio();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future deleteVacancy ( String jobId) async{
    try{
      String? token = await storage.read(key: "access_token");
      String? accessToken =  token!.replaceAll('"', '');
      String? path = ApiConfig.apiBaseUrl + ApiConfig.jobVacancy + jobId;

      Response respones = await dio.delete(path,options: Options(headers:  {"authorization": "Bearer $accessToken"}));
       
       if(respones.statusCode == 200 || respones.statusCode == 201){
        log("jobvacancy deleted");
         showSimpleNotification(
          const Text('Vacancy deleted successfully!'),
          background: Colors.green, duration: const Duration(seconds: 2));
       }
    } on DioError catch (e){
      log("error deleting vacancy");
      log(e.message.toString());
    }

  }
} 