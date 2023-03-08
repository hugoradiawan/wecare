import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/UIs/home_page/home_page.dart';
import 'package:wecare/UIs/login_register/login_register_page.dart';
import 'package:wecare/UIs/splashscreen.dart';
import 'package:wecare/business_logics/auth_controller.dart';

class AuthNavigator extends GetView<AuthController> {
  const AuthNavigator({super.key});

  @override
  Widget build(_) => Obx(
        () => Navigator(
          pages: [
            if (!controller.splashscreenOff.value)
              const MaterialPage(child: SplashScreen())
            else if (controller.currentUser.value == null)
              const MaterialPage(child: LoginRegisterPage())
            else
              const MaterialPage(child: HomePage())
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
      );
}
