import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/business_logics/firebase/firebase_auth.dart';
import 'package:wecare/constants.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    required this.icon,
    this.isCircle = false,
    this.circleShaped = false,
    this.isSelected = false,
    super.key,
  });
  final IconData icon;
  final bool isCircle, circleShaped, isSelected;

  @override
  Widget build(_) => InkWell(
        onTap: () {
          Get.defaultDialog(
            title: 'Auth',
            middleText: 'Log out?',
            onConfirm: () async {
              await Get.find<FirebaseAuthService>().signOut();
              Get.back();
            },
          );
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isSelected ? baseColor : baseColor.withAlpha(60),
              borderRadius: !isCircle
                  ? BorderRadius.circular(circleShaped ? 200 : 8)
                  : null,
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : baseColor,
            ),
          ),
        ),
      );
}
