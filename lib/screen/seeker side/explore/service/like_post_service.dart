import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';

class LikePostService {
  Dio dio = Dio();
  List? likeCounts;

  //--------- like function -----------//
  Future<void> postLikeService(String postId)async{
     FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String path ="${ApiConfig.apiBaseUrl}${ApiConfig.postOption}$postId/like";

     try{
      Response response = await dio.post(path,options:  Options(headers: {"authorization": "Bearer $accessToken"}),
     );

      if(response.statusCode == 200 || response.statusCode == 201){
        log(response.data.toString());
      }
      
    }on DioError catch (e){
      log("error while liking");
      log("${e.message}");
    }

  }
   //----------- Dislike function ----------//
   
   Future<void> dislikePostService(String postId)async{
     FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String path ="${ApiConfig.apiBaseUrl}${ApiConfig.postOption}$postId/like";

     try{
      Response response = await dio.delete(path,options:  Options(headers: {"authorization": "Bearer $accessToken"}),
     );

      if(response.statusCode == 200 || response.statusCode == 201){
        log(response.data.toString());
      }
      
    }on DioError catch (e){
      log("error while disliking");
      log("${e.message}");
    }

  }
}