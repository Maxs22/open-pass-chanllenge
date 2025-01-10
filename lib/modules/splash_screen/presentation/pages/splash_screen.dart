import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_pass_challenge/core/constants/assets.dart';
import 'package:open_pass_challenge/core/constants/strings.dart';
import 'package:open_pass_challenge/modules/splash_screen/presentation/controllers/splash_screen_controller.dart';
import 'package:open_pass_challenge/core/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller =
        Get.find<SplashScreenController>();

    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: controller.animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ConstantsStrings.titleSplash,
                style: TextStyle(
                  color: AppColors.splashScreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // shadows: [
                  //   Shadow(
                  //     offset: const Offset(2, 2), 
                  //     blurRadius: 4,
                  //     color: AppColors.primaryColor.withOpacity(0.5),
                  //   ),
                  // ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Image.asset(ConstantsAssets.logo, width: 250),
            ],
          ),
        ),
      ),
    );
  }
}
