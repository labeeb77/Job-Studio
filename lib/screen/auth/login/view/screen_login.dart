import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/controller/local_provider.dart';
import 'package:job_studio/screen/auth/login/controller/login_provider.dart';

import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/auth/login/view/widgets/google_sign_button-widget.dart';
import 'package:job_studio/screen/auth/login/view/widgets/text_field_widgte.dart';
import 'package:job_studio/screen/auth/sign%20up/view/screeen_signup.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
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
                height: 100,
              ),
              const Center(
                  child: Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              )),
              const SizedBox(
                height: 100,
              ),

              // Email
              MyTextField(
                controller: provider.emailController,
                hintText: 'Email',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: themeColor,
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
                    color: themeColor,
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
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 160),
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Color.fromARGB(255, 133, 132, 132)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // Login button
              Consumer<LoginProvider>(
                builder: (context, value, child) => MyButton(
                  buttonText: 'LOGIN',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      showSimpleNotification(const LinearProgressIndicator());
                      value.checkLogin(context);
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),
              // Google Sign in
              const GoogleSignButton(googleButtonText: 'SIGN IN WITH GOOGLE'),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "You don't have an account yet?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500),
                      ),
                    )
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
