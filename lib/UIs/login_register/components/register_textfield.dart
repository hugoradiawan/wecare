import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/ui_logics/login_or_register_controller.dart';

class RegisterTextField extends GetView<LoginOrRegisterController> {
  const RegisterTextField(this.label, {super.key});
  final String label;

  @override
  Widget build(_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 8,
              ),
              child: Row(children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.theme.colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.theme.colorScheme.error,
                    fontSize: 16,
                  ),
                ),
              ]),
            ),
            Obx(
              () {
                final bool isPasswordHidden = controller.isPasswordHidden.value;
                return TextField(
                  onChanged: (value) {
                    controller.loginRegisterData.update((val) {
                      if (val == null) return;
                      if (label == 'Email') {
                        val.email = value;
                      } else {
                        val.password = value;
                      }
                    });
                  },
                  obscureText: label == 'Password' && isPasswordHidden,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    suffixIcon: label == 'Password'
                        ? IconButton(
                            icon: Icon(
                              isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Get.theme.colorScheme.primary,
                            ),
                            onPressed: () =>
                                controller.isPasswordHidden.toggle(),
                          )
                        : null,
                    contentPadding: const EdgeInsets.fromLTRB(30, -10, 30, 20),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    label: Text(
                      label,
                      style: TextStyle(
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ]);
}
