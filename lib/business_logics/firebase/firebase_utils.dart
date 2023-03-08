import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:wecare/business_logics/firebase/firebase_auth.dart';
import 'package:wecare/business_logics/firebase/firestore_service.dart';

class FireUtils {
  static initAllServices() async {
    await Firebase.initializeApp();
    Get.put(FirebaseAuthService());
    Get.put(FirestoreService());
  }
}
