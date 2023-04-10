import 'dart:developer';

import 'package:dio/dio.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/model/create_vacancy_model.dart';
import 'package:overlay_support/overlay_support.dart';

class UpdateVacancyService {
  Dio dio = Dio();
  Future<void> updateVacancyService(
      CreateVacancyModel model, String vacancyId) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String? path = ApiConfig.apiBaseUrl + ApiConfig.jobVacancy + vacancyId;

    try {
      Response response = await dio.put(path,
          data: model.toJson(),
          options: Options(headers: {"authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        showSimpleNotification(const Text('Vacancy updated successfully!'),
            background: Colors.green, duration: const Duration(seconds: 2));
      }
    } on DioError catch (e) {
      log("dio error occure in update");
      log("${e.message}");
    }
  }
}
