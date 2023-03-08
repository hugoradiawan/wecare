import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/business_logics/auth_controller.dart';
import 'package:wecare/business_logics/firebase/firebase_utils.dart';
import 'package:wecare/wecare_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FireUtils.initAllServices();
  Get.put(AuthController());
  runApp(const WeCareApp());
}
