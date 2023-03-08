import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/business_logics/firebase/firebase_auth.dart';
import 'package:wecare/business_logics/login_data.dart';

class LoginOrRegisterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Rx<LoginRegisterData> loginRegisterData =
      Rx<LoginRegisterData>(LoginRegisterData('', ''));
  final RxBool rememberMe = RxBool(false), isPasswordHidden = RxBool(false);
  late TabController tabController;
  late FirebaseAuthService fas;

  Future<void> loginWithExternalProvider(String provider) async {
    switch (provider) {
      case 'Google':
        await fas.googleSignIn();
        break;
      default:
        showUnderDevelopment(provider);
    }
  }

  Future<void> onSignUp() async {
    if (validateInput()) {
      await fas.signUp(loginRegisterData.value);
      Get.defaultDialog(
          title: 'Success',
          content: const Text('Account created successfully!'));
    }
  }

  Future<void> onSignIn() async {
    if (validateInput()) await fas.signIn(loginRegisterData.value);
  }

  bool emailValidator(String value) {
    if (value.isEmpty) {
      Get.defaultDialog(
          title: 'Warning', content: const Text('Please enter an email'));
      return false;
    } else if (!value.contains('@')) {
      Get.defaultDialog(
          title: 'Warning', content: const Text('Please enter a valid email'));
      return false;
    } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value)) {
      Get.defaultDialog(
          title: 'Warning', content: const Text('Please enter a valid email'));
      return false;
    } else {
      return true;
    }
  }

  bool passwordValidator(String value) {
    if (value.isEmpty) {
      Get.defaultDialog(
          title: 'Warning', content: const Text('Please enter a password'));
      return false;
    } else if (value.length < 6) {
      Get.defaultDialog(
          title: 'Warning',
          content: const Text('Password length must be greater than 6'));
      return false;
    } else {
      return true;
    }
  }

  bool validateInput() {
    if (!emailValidator(loginRegisterData.value.email)) return false;
    if (!passwordValidator(loginRegisterData.value.password)) return false;
    return true;
  }

  void showUnderDevelopment(String provider) {
    Get.defaultDialog(
      title: 'Warning',
      content: Text('Login with $provider is still under development'),
    );
  }

  void toRegisterPage() => tabController.animateTo(2);

  void toLoginPage() => tabController.animateTo(1);

  void toExternalLoginPage() => tabController.animateTo(0);

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    fas = Get.find<FirebaseAuthService>();
    super.onReady();
  }
}
