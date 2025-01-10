import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_pass_challenge/bindings.dart';
import 'package:open_pass_challenge/core/constants/strings.dart';
import 'package:open_pass_challenge/core/routes/routes.dart';
import 'package:open_pass_challenge/core/utils/app_colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      title: ConstantsStrings.titleMain,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkSpace,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkSpace,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.white),
          bodyMedium: TextStyle(color: AppColors.white),
        ),
      ),
      initialRoute: AppRouteName.splashScreen,
      getPages: appRoutes,
      initialBinding: GetBindings(),
    );
  }
}
