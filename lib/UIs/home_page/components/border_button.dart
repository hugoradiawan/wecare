import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/constants.dart';

class BorderButton extends StatelessWidget {
  const BorderButton(this.label, {super.key});
  final String label;

  @override
  Widget build(_) => Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: baseColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
            color: baseColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
}