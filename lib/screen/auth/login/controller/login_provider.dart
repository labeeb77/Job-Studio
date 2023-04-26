import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/screen/auth/login/model/login_req_model.dart';
import 'package:job_studio/screen/auth/login/service/login_service.dart';
import 'package:job_studio/screen/recruiter%20side/bottom%20nav/bottom_nav_bar.dart';
import 'package:job_studio/screen/seeker%20side/bottom%20nav/bottom_nav_bar.dart';
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
    await LoginSevice().loginService(loginUser, context).then((value) async {
      log("entered to login service");

      notifyListeners();
      if (value != null) {
        log("matched");
        loginStorage.write(
          key: "access_token",
          value: jsonEncode(value.accessToken),
        );
        loginStorage.write(key: "role", value: jsonEncode(value.user.role));
        log(value.user.role.toString());

        final checkRole = await loginStorage.read(key: "role");
        log(checkRole.toString());

        if (value.user.role == "recruiter") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>  BottomNavRecruiter(),
            ),
          );
        } else if (value.user.role == "seeker") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>  BottomNavSeeker(),
            ),
          );
        }

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
