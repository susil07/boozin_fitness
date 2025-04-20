import 'package:boozin_fitness/domain/entities/daily_activity.dart';

abstract class ActivityRepository {
  Future<DailyActivity> fetchToday();
}
