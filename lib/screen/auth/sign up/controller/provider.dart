import 'package:flutter/material.dart';
import 'package:job_studio/screen/auth/sign%20up/model/signup_req_model.dart';
import 'package:job_studio/screen/auth/sign%20up/service/signup_service.dart';

class SignUpProvider with ChangeNotifier {
  // text editing controllers
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

  Future<String> checkSignUp() async {
    final username = userNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final userSignUp =
        SignupReqModel(email: email, password: password, username: username);

    String allData = await SignUpService().signUpService(userSignUp);
    return allData;
  }
}
