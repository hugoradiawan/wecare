import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/UIs/login_register/components/circle_login_button.dart';
import 'package:wecare/UIs/login_register/components/register_textfield.dart';
import 'package:wecare/ui_logics/login_or_register_controller.dart';

class RegisterTab extends GetView<LoginOrRegisterController> {
  const RegisterTab({super.key});

  @override
  Widget build(_) =>
      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Center(
          child: Image.asset(
            'assets/splashscreen.png',
            height: Get.height * 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Sign up for free',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.theme.colorScheme.primary,
              fontSize: 25,
            ),
          ),
        ),
        const RegisterTextField('Email'),
        const RegisterTextField('Password'),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(Get.width * 0.8, Get.height * 0.06),
            backgroundColor: Get.theme.colorScheme.primary,
          ),
          onPressed: () => controller.onSignUp(),
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Get.theme.colorScheme.surface,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'or continue with',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ['Facebook', 'Google', 'Apple']
              .map((provider) => CicleLoginButton(provider))
              .toList(),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Already have an account? ',
            style: TextStyle(
              color: Get.theme.colorScheme.tertiary.withAlpha(160),
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () => controller.toLoginPage(),
            child: Text(
              'Log in',
              style: TextStyle(
                color: Get.theme.colorScheme.primary,
                fontSize: 16,
              ),
            ),
          ),
        ])
      ]);
}
