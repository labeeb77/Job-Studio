import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/create_vacancy_model.dart';

class CreateVacancyService {
  Dio dio = Dio();
  Future<void> createVacancyService(CreateVacancyModel model) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String? path = ApiConfig.apiBaseUrl + ApiConfig.createVacancy;

    try {
      Response response = await dio.post(path,
          data: model.toJson(),
          options: Options(headers: {"authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
      }
    } on DioError catch (e) {
      log("dio error occure in vacancy");
      log("${e.message}");
    }
  }
}
