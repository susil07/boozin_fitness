import 'package:boozin_fitness/infrastructure/navigation/bindings/global.binding.dart';
import 'package:boozin_fitness/infrastructure/navigation/navigation.dart';
import 'package:boozin_fitness/presentation/theme/app_theme.dart';
import 'package:boozin_fitness/presentation/theme/theme_controller.dart';
import 'package:boozin_fitness/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import 'infrastructure/navigation/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ThemeController(), permanent: true);

  runApp(
    GetMaterialApp(
      title: 'Boozin Fitness',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: Get.find<ThemeController>().mode.value,
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      builder: (context, child) {
        return EnvironmentsBadge(child: child!);
      },
    ),
  );
}


