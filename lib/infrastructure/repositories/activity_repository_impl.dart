
import 'package:boozin_fitness/domain/entities/daily_activity.dart';
import 'package:boozin_fitness/domain/repositories/activity_repository.dart';
import '../dal/services/health_service.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final HealthService _service;
  ActivityRepositoryImpl(this._service);

  @override
  Future<DailyActivity> fetchToday() => _service.readToday();
}
