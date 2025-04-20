import 'package:boozin_fitness/domain/entities/daily_activity.dart';
import 'package:boozin_fitness/domain/repositories/activity_repository.dart';

class ActivityRepositoryFake implements ActivityRepository {
  @override
  Future<DailyActivity> fetchToday() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return DailyActivity(steps: 4678, kcal: 312);
  }
}
