import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/ui_logics/login_or_register_controller.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(this.providerName, {super.key});
  final String providerName;

  @override
  Widget build(_) => ElevatedButton.icon(
        onPressed: () => Get.find<LoginOrRegisterController>()
            .loginWithExternalProvider(providerName),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(Get.width * 0.8, Get.height * 0.08),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: BorderSide(
              color: Get.theme.colorScheme.primary.withAlpha(40),
              width: 1,
            )),
        icon: Image.asset(
          'assets/${providerName.toLowerCase()}.png',
          width: 40,
          height: 40,
        ),
        label: Text(
          providerName,
          style: const TextStyle(fontSize: 16),
        ),
      );
}
