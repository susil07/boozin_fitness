import '../entities/daily_activity.dart';
import '../repositories/activity_repository.dart';

class GetDailyActivity {
  final ActivityRepository _repo;
  GetDailyActivity(this._repo);

  Future<DailyActivity> call() {
    return _repo.fetchToday();
  }
}
