import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/auth/login/model/login_req_model.dart';
import 'package:job_studio/screen/auth/login/model/login_resp_model.dart';
import 'package:overlay_support/overlay_support.dart';

class LoginSevice {
  Dio dio = Dio();

  Future<LoginResModel?> loginService(LoginReqModel model, context) async {
    String path = ApiConfig.apiBaseUrl + ApiConfig.login;
    try {
      Response response =
          await dio.post(path, data: jsonEncode(model.toJson()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        
        if (response.data["status"] == 422) {
          log("wrong email and password");
          return null;
        } else {
          final LoginResModel loginResp =
              LoginResModel.fromJson(response.data);
          return loginResp;
        }
      }
    } on DioError catch (e) {
      log(e.message.toString());
      showSimpleNotification(const Text('No internet connection'),
          background: Colors.black, duration: const Duration(seconds: 3));
    }
    return null;
  }
}
