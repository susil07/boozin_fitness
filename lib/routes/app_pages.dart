import 'package:boozin_fitness/infrastructure/navigation/bindings/controllers/home.controller.binding.dart';
import 'package:boozin_fitness/infrastructure/navigation/bindings/controllers/splash.controller.binding.dart';
import 'package:boozin_fitness/infrastructure/navigation/routes.dart';
import 'package:boozin_fitness/presentation/home/home.screen.dart';
import 'package:boozin_fitness/presentation/splash/splash.screen.dart';
import 'package:get/get.dart';



class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: Routes.SPLASH,
      page: () =>  SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () =>  HomeScreen(),
      binding: HomeControllerBinding(),
    ),
  ];
}
