import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';

class SearchJobvacancyService {
  Dio dio = Dio();
  Future<List<GetJobModel>?> searchJobs(String searchQuery)async{
     FlutterSecureStorage storage = const FlutterSecureStorage();
     String? token = await storage.read(key: "access_token");
    
    String? accessToken = token!.replaceAll('"', '') ;
    String? path = "${ApiConfig.apiBaseUrl}${ApiConfig.createVacancy}?position=$searchQuery";
    try{
      Response response = await dio.get(path,options: Options(headers: {"authorization": "Bearer $accessToken"}));
      if(response.statusCode == 200 || response.statusCode == 201){
         log(response.statusCode.toString());
        log(response.data.toString());

        final List<GetJobModel> searchedjobs = (response.data as List).map((e) => GetJobModel.fromJson(e)).toList();
        return searchedjobs;
      }
      return null;
    }
    on DioError catch (e){
      log("error getting searched jobs");
        log("${e.message}");
    }
    return null;
  }
}