import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/auth/otp%20screen/model/model.dart';
import 'package:job_studio/screen/auth/sign%20up/model/signup_resp_model.dart';

class OtpService {
  Dio dio = Dio();
  Future<SignUpRespModel?> otpVerification(
    OtpModel model ,context
  )async{
    String path = ApiConfig.apiBaseUrl + ApiConfig.otp;
    Response response = await dio.post(path,data: model.toJson());
    if(response.statusCode == 201){
      log(response.data.toString());

      if(response.data['access_token'] != null) {
        SignUpRespModel signUpResp = SignUpRespModel.fromJson(response.data);
        return signUpResp;
      }else{
        log('OTP action failed');
        return null;
      }
    }
    return null;
  }
}