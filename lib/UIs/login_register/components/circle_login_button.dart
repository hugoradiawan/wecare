import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/ui_logics/login_or_register_controller.dart';

class CicleLoginButton extends StatelessWidget {
  const CicleLoginButton(this.label, {super.key});
  final String label;

  @override
  Widget build(_) => InkWell(
        onTap: () => Get.find<LoginOrRegisterController>()
            .loginWithExternalProvider(label),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.grey),
              left: BorderSide(width: 1.0, color: Colors.grey),
              right: BorderSide(width: 1.0, color: Colors.grey),
              bottom: BorderSide(width: 1.0, color: Colors.grey),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/${label.toLowerCase()}.png',
              width: 20,
              height: 20,
            ),
          ),
        ),
      );
}
