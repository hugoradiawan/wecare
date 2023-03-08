import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/UIs/login_register/components/login_button.dart';
import 'package:wecare/ui_logics/login_or_register_controller.dart';

class ExternalLoginTab extends GetView<LoginOrRegisterController> {
  const ExternalLoginTab({super.key});

  @override
  Widget build(_) =>
      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset('assets/welcome.png'),
        Text(
          'Let\'s you in',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Get.theme.colorScheme.primary,
            fontSize: 25,
          ),
        ),
        ...['Facebook', 'Google', 'Apple']
            .map((provider) => LoginButton(provider))
            .toList(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'or',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(Get.width * 0.8, Get.height * 0.06),
            backgroundColor: Get.theme.colorScheme.primary,
          ),
          onPressed: () => controller.toLoginPage(),
          child: Text(
            'Sign in with email',
            style: TextStyle(
              color: Get.theme.colorScheme.surface,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Dont\' have an account? ',
            style: TextStyle(
              color: Get.theme.colorScheme.tertiary.withAlpha(160),
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () => controller.toRegisterPage(),
            child: Text(
              'Sign up',
              style: TextStyle(
                color: Get.theme.colorScheme.primary,
                fontSize: 16,
              ),
            ),
          ),
        ])
      ]);
}
