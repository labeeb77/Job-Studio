import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/seeker%20side/explore/model/get_uploaded_model.dart';

class GetUploadedService{
  Dio dio = Dio();

  Future<List<GetUploadedModel>?> fetchUploadedService ()async{
      FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    
    String? accessToken = token!.replaceAll('"', '') ;
    String? path = ApiConfig.apiBaseUrl + ApiConfig.post;

    try{
      Response response = await dio.get(path, options: Options(headers: {"authorization": "Bearer $accessToken"})
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        log(response.statusCode.toString());
        log(response.data.toString());

        if(response.data is List){
           final List<GetUploadedModel> uploadedData = (response.data as List).map((e) => GetUploadedModel.fromJson(e)).toList();
        return uploadedData;
        

        }else if (response.data is Map){
             final List<GetUploadedModel> uploadedData = [GetUploadedModel.fromJson(response.data)];
        return uploadedData;
          
        }

       
        
        
      }
    } on DioError catch (e){
      log("error getting uploaded data");
        log("${e.message}");
    }
    return null;


  }
}