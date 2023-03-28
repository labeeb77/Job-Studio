import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/screen/auth/login/model/login_req_model.dart';
import 'package:job_studio/screen/auth/login/service/login_service.dart';
import 'package:job_studio/screen/select%20role%20screen/view/screen_selectrole.dart';
import 'package:overlay_support/overlay_support.dart';

class LoginProvider with ChangeNotifier {
  final FlutterSecureStorage loginStorage = const FlutterSecureStorage();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> checkLogin(context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    log("entered to login function");

    final loginUser = LoginReqModel(email: email, password: password);
    await LoginSevice().loginService(loginUser, context).then((value) {
      log("entered to login service");

      notifyListeners();
      if (value != null) {
        log("matched");
        loginStorage.write(
          key: "access_token",
          value: jsonEncode(value.accessToken),
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SelectRoleScreen(),
          ),
        );

        emailController.clear();
        passwordController.clear();
      } else {
        showSimpleNotification(
          background: Colors.red,
          const Text("email and password not match !!"),
        );

        log("email and password not match");

        notifyListeners();
      }
    });

    notifyListeners();
  }
}
