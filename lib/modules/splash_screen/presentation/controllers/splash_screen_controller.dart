import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_pass_challenge/core/routes/routes.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..forward();

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.offAllNamed(AppRouteName.characterPage);
      }
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
