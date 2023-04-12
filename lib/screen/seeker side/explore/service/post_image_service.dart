import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/seeker%20side/explore/model/post_image_model.dart';

class ImagepostService {
  Dio dio = Dio();

  Future<void>postImage(PostImageModel model)async{
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String path = ApiConfig.apiBaseUrl + ApiConfig.post;

    try{
      Response response = await dio.post(path,
      data: model.toJson(),
      options: Options(headers: {"authorization": "Bearer $accessToken"}));

      if(response.statusCode == 200 || response.statusCode == 201){
        log(response.data.toString());
        log(response.statusCode.toString());
      }
    } on DioError catch (e){
      log("error posting image");
      log("${e.message}");
    }

  }
}