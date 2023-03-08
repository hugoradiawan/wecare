import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wecare/business_logics/firebase/firebase_auth.dart';

class AuthController extends GetxController {
  final Rxn<User> currentUser = Rxn<User>();
  final RxBool splashscreenOff = false.obs;
  final FirebaseAuthService fas = Get.find<FirebaseAuthService>();

  @override
  void onInit() {
    currentUser.bindStream(fas.userStream);
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(
      const Duration(seconds: 5),
      () => splashscreenOff.value = true,
    );
    super.onReady();
  }
}
