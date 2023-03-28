import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/screen/auth/otp%20screen/model/model.dart';
import 'package:job_studio/screen/auth/otp%20screen/service/otp_service.dart';
import 'package:job_studio/screen/auth/sign%20up/controller/provider.dart';
import 'package:job_studio/screen/auth/sign%20up/model/signup_resp_model.dart';
import 'package:provider/provider.dart';

class OtpProvider with ChangeNotifier{
   TextEditingController otpTextEditingController1 = TextEditingController();
  TextEditingController otpTextEditingController2 = TextEditingController();
  TextEditingController otpTextEditingController3 = TextEditingController();
  TextEditingController otpTextEditingController4 = TextEditingController();
  TextEditingController otpTextEditingController5 = TextEditingController();
  TextEditingController otpTextEditingController6 = TextEditingController();

  FlutterSecureStorage signUpStorage = const FlutterSecureStorage();
   Future <String>otpChecking(context)async{
    String otp = otpTextEditingController1.text +
    otpTextEditingController2.text +
    otpTextEditingController3.text +
    otpTextEditingController4.text +
    otpTextEditingController5.text +
    otpTextEditingController6.text;
    final email = Provider.of<SignUpProvider>(context,listen: false).emailController.text.trim();

    final verifiedOtp = OtpModel(email: email, otp: int.parse(otp));
    SignUpRespModel? signUpModel = await OtpService().otpVerification(verifiedOtp, context);
    if(signUpModel !=null){
      signUpStorage.write(key: 'access_token', value: signUpModel.accessToken);
      return "success";
    }else{
      return "Invalid OTP sent";
    }
   }

  
}
