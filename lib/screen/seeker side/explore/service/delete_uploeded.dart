import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:overlay_support/overlay_support.dart';

class DeleteUploadedService {
  Dio dio = Dio();
   
  Future deleteUploaded (String userId)async{

    FlutterSecureStorage storage = const FlutterSecureStorage();
      String? token = await storage.read(key: "access_token");
      String? accessToken =  token!.replaceAll('"', '');
      String? path = ApiConfig.apiBaseUrl + ApiConfig.postOption + userId;
    try{

Response respones = await dio.delete(path,options: Options(headers:  {"authorization": "Bearer $accessToken"}));
       
       if(respones.statusCode == 200 || respones.statusCode == 201){
        log(respones.data.toString());
        log("post deleted");
         showSimpleNotification(
          const Text('Post deleted successfully!'),
          background: Colors.green, duration: const Duration(seconds: 2));
       }
    }
    on DioError catch (e){
      log("error deleting posts");
      log(e.message.toString());
    }
  }

}