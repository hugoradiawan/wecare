import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wecare/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(_) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/splashscreen.png'),
              const SizedBox(height: 20),
              LoadingAnimationWidget.hexagonDots(
                color: baseColor,
                size: 70,
              )
            ],
          ),
        ),
      );
}
