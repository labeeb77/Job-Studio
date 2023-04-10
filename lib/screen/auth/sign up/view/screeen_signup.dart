import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/controller/local_provider.dart';
import 'package:job_studio/screen/auth/login/view/screen_login.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';

import 'package:job_studio/screen/auth/login/view/widgets/google_sign_button_widget.dart';
import 'package:job_studio/screen/auth/login/view/widgets/text_field_widgte.dart';
import 'package:job_studio/screen/auth/otp%20screen/view/otp_screen.dart';
import 'package:job_studio/screen/auth/sign%20up/controller/provider.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Center(
                  child: Text(
                'Create an Account',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              )),
              const SizedBox(
                height: 50,
              ),

              //User name
              MyTextField(
                controller: provider.userNameController,
                hintText: 'First name',
                prefixIcon: const Icon(
                  Icons.person,
                  color: Color(0xFF8b157f),
                ),
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter firstname";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 20,
              ),
              // Email
              MyTextField(
                controller: provider.emailController,
                hintText: 'Email',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Color(0xFF8b157f),
                ),
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 20,
              ),

              //password
              Consumer<LocalProvider>(
                builder: (context, value, child) => MyTextField(
                  controller: provider.passwordController,
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.password_rounded,
                    color: Color(0xFF8b157f),
                  ),
                  obscureText: !value.isVisible,
                  suffixIcon: IconButton(
                      onPressed: () {
                        value.toggleVisibility();
                      },
                      icon: Icon(value.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  hasSuffixIcon: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              // confirm password
              Consumer<LocalProvider>(
                builder: (context, value, child) => MyTextField(
                  controller: provider.confirmPassword,
                  hintText: 'Confirm Password',
                  prefixIcon: const Icon(
                    Icons.password_rounded,
                    color: Color(0xFF8b157f),
                  ),
                  obscureText: !value.isVisible,
                  suffixIcon: IconButton(
                      onPressed: () {
                        value.toggleVisibility();
                      },
                      icon: Icon(value.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  hasSuffixIcon: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    } else {
                      if (provider.passwordController.text.toString().trim() !=
                          provider.confirmPassword.text.toString().trim()) {
                        return 'Password must be same';
                      }
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // privacy policy and Terms and conditions
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: RichText(
                    text: const TextSpan(
                        text:
                            'By clicking Sign up, you are agree to JobStudio ',
                        style: TextStyle(color: kGreyColor),
                        children: <TextSpan>[
                      TextSpan(
                          text: ' Privacy policy',
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(
                          text: ' and ', style: TextStyle(color: kGreyColor)),
                      TextSpan(
                          text: 'Terms and conditions',
                          style: TextStyle(color: Colors.blue))
                    ])),
              ),

              const SizedBox(
                height: 30,
              ),
              // Sign up button
              MyButton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    final result = await provider.checkSignUp();
                    log(result.toString());
                    if (result == "Success") {
                      if (context.mounted) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ScreenOTP(),
                        ));
                      }
                    }
                  }
                },
                buttonText: 'SIGN UP',
              ),

              const SizedBox(height: 20),
              // Google Sign up
              const GoogleSignButton(googleButtonText: 'SIGN UP WITH GOOGLE '),

              Padding(
                padding: const EdgeInsets.only(right: 60, left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "You have an account?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenLogin(),
                          ));
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
