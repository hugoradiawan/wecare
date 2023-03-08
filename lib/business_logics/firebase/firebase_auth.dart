import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wecare/business_logics/login_data.dart';

class FirebaseAuthService extends GetxService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn(LoginRegisterData data) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: 'Warning',
            content: const Text('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            title: 'Warning',
            content: const Text('Wrong password provided for that user.'));
      }
    } catch (e) {
      Get.defaultDialog(
          title: 'Warning',
          content: const Text('Something went wrong. Please try again.'));
    }
  }

  Future<void> signUp(LoginRegisterData data) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
            title: 'Warning',
            content: const Text('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            title: 'Warning',
            content: const Text('The account already exists for that email.'));
      }
    } catch (e) {
      Get.defaultDialog(
          title: 'Warning',
          content: const Text('Something went wrong. Please try again.'));
    }
  }

  Stream<User?> get userStream => _firebaseAuth.userChanges();

  Future<void> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
