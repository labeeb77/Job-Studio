import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/recruiter%20side/home/model/appleid_job_model.dart';

class GetAppliedJobService {
  Dio dio = Dio();

  Future<List<GetAppliedPeopleModel>?> fetchAppliedPoeple(String jobId) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");

    String? accessToken = token!.replaceAll('"', '');
    String? path =
        "${ApiConfig.apiBaseUrl}${ApiConfig.jobVacancy}$jobId/applications";

    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200) {
        log(response.data.toString());

        final List<GetAppliedPeopleModel> appliedPeople =
            (response.data as List)
                .map((e) => GetAppliedPeopleModel.fromJson(e))
                .toList();
        log(appliedPeople.toString());
        return appliedPeople;
      }
    } on DioError catch (e) {
      log("${e.message}");
      log("error getting applied people");
    }
    return null;
  }
}
