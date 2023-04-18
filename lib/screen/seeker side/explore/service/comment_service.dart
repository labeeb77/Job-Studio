import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';

class CommnetService {
  Dio dio = Dio();
  Future commnetService(String postId,String comment)async{
     FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String path ="${ApiConfig.apiBaseUrl}${ApiConfig.postOption}$postId/comment";

    try{
      Response response = await dio.post(path,options:  Options(headers: {"authorization": "Bearer $accessToken"}),
      data: {"comment": comment});

      if(response.statusCode == 200 || response.statusCode == 201){
        log(response.data.toString());
      }
      
    }on DioError catch (e){
      log("error while commenting");
      log("${e.message}");
    }

  }
}