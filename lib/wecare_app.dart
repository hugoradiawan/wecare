import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/auth_navigator.dart';
import 'package:wecare/constants.dart';

class WeCareApp extends StatelessWidget {
  const WeCareApp({super.key});

  @override
  Widget build(_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wecare',
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: baseColor,
          ),
        ),
        home: const AuthNavigator(),
      );
}
