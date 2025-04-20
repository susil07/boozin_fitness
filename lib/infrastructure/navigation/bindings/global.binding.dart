
import 'package:boozin_fitness/presentation/theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:boozin_fitness/infrastructure/dal/services/health_service.dart';
import 'package:boozin_fitness/infrastructure/repositories/activity_repository_impl.dart';
import 'package:boozin_fitness/domain/repositories/activity_repository.dart';
import 'package:boozin_fitness/domain/usecases/get_daily_activity.dart';


class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthService>(() => HealthService());
    Get.lazyPut<ActivityRepository>(
      () => ActivityRepositoryImpl(Get.find<HealthService>()),
    );
    Get.lazyPut<GetDailyActivity>(
      () => GetDailyActivity(Get.find<ActivityRepository>()),
    );
    Get.put(ThemeController(), permanent: true);
  }
}
