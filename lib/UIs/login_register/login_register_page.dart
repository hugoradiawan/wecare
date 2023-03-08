import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/UIs/login_register/tabs/external_login_tab.dart';
import 'package:wecare/UIs/login_register/tabs/login_tab.dart';
import 'package:wecare/UIs/login_register/tabs/register_tab.dart';
import 'package:wecare/ui_logics/login_or_register_controller.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({super.key});

  @override
  Widget build(_) => Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: GetBuilder<LoginOrRegisterController>(
              init: LoginOrRegisterController(),
              builder: (controller) => Padding(
                padding: const EdgeInsets.all(16),
                child: TabBarView(
                  controller: controller.tabController,
                  children: const [
                    ExternalLoginTab(),
                    LoginTab(),
                    RegisterTab()
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
