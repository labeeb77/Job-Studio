import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/get_vacancy_model.dart';

class GetJobService {
  Dio dio = Dio();
  Future<List<GetJobModel>?> fetchjobs() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    if (token == null) {
      return null;
    }
    String? accessToken = token.replaceAll('"', '') ;
    String? path = ApiConfig.apiBaseUrl + ApiConfig.getJobVacany;

    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        log(response.data.toString());
        // List<dynamic> data = response.data;

        final List<GetJobModel> jobs =
            (response.data as List).map((e) => GetJobModel.fromJson(e)).toList();
            log(jobs.toString());
        return jobs;
      }
    } on DioError catch (e) {
      log("error getting jobs");
      log("${e.message}");
    }
    return null;
  }
}
