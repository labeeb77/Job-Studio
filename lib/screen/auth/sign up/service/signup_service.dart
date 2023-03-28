import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/auth/sign%20up/model/signup_req_model.dart';

class SignUpService {
  Dio dio = Dio();

  Future<String>signUpService(SignupReqModel model)async{
    String path = ApiConfig.apiBaseUrl + ApiConfig.signUp;
    try {
      Response response = await dio.post(path,data: model.toJson());

      if(response.statusCode == 201){
        log(response.data.toString());

      }else{
        return "errro occur";
      }
    } on DioError catch (e) {
      log(e.message.toString());

    }
    return "Success";

  }

}