import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimer() {
    Timer(const Duration(seconds: 2), () async {
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.all(140.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/logo.png"), fit: BoxFit.contain),
        ),
      ),
    );
  }
}
