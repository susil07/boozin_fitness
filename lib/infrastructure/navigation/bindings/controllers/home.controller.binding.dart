import 'package:boozin_fitness/domain/usecases/get_daily_activity.dart';
import 'package:boozin_fitness/presentation/home/controllers/home.controller.dart';
import 'package:get/get.dart';


class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find<GetDailyActivity>(), 
      ),
    );
  }
}
