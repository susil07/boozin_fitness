
import 'package:get/get.dart';
import 'package:boozin_fitness/infrastructure/navigation/routes.dart';

enum SplashStage { icon, logo, full }

class SplashController extends GetxController {
  final stage = SplashStage.icon.obs;

  @override
  void onReady() {
    Future.delayed(Duration(milliseconds: 800),  () => stage(SplashStage.logo));
    Future.delayed(Duration(milliseconds: 1400), () => stage(SplashStage.full));
    Future.delayed(Duration(milliseconds: 3000), () => Get.offAllNamed(Routes.HOME));
  }
}
