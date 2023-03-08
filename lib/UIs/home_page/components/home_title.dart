import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/constants.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({required this.title, this.icon, super.key});
  final String title;
  final IconData? icon;

  @override
  Widget build(_) => Expanded(
        child: Container(
          width: Get.width * 0.85,
          margin: const EdgeInsets.all(8),
          child: Row(children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (icon != null)
              IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  size: 15,
                  color: baseColor,
                ),
              )
          ]),
        ),
      );
}
