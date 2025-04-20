import 'dart:io';
import 'package:health/health.dart';
import 'package:boozin_fitness/domain/entities/daily_activity.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';

class HealthService {
  final Health _health = Health();
  bool _isConfigured = false;

  static const List<HealthDataType> _types = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];


  Future<bool> ensurePermissions() async {
    final activityStatus = await Permission.activityRecognition.status;
    final locationStatus = await Permission.location.status;
    final sensorsStatus = await Permission.sensors.status;

    final permissionsToRequest = <Permission>[
      if (!activityStatus.isGranted) Permission.activityRecognition,
      if (!locationStatus.isGranted) Permission.location,
      if (!sensorsStatus.isGranted) Permission.sensors,
    ];

    if (permissionsToRequest.isNotEmpty) {
      final results = await permissionsToRequest.request();
      return results.values.every((status) => status.isGranted);
    }

    return true;
  }

  Future<void> openHealthConnectSettings() async {
    if (Platform.isAndroid) {
      const intent = AndroidIntent(
        action: 'android.settings.HEALTH_CONNECT_SETTINGS',
        flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
      );
      await intent.launch();
    }
  }

  Future<DailyActivity> readToday() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);

    try {

      final permissionGranted = await ensurePermissions();
      if (!permissionGranted) {
        throw Exception('Runtime permissions not granted.');
      }

      if (!_isConfigured) {
        await _health.configure();
        _isConfigured = true;
      }


      final granted = await _health.requestAuthorization(
        _types,
        permissions: _types.map((_) => HealthDataAccess.READ).toList(),
      );

      if (!granted) {
        print(' Health Connect access not granted — opening settings...');
        await openHealthConnectSettings();
        throw Exception(' Health Connect permission not granted by user');
      }

      
      final records = await _health.getHealthDataFromTypes(
        types: _types,
        startTime: startOfDay,
        endTime: now,
      );

      int stepsSum = 0;
      double kcalSum = 0;

      for (final rec in records) {
        final value = rec.value as num? ?? 0;

        if (rec.type == HealthDataType.STEPS) {
          stepsSum += value.toInt();
        } else if (rec.type == HealthDataType.ACTIVE_ENERGY_BURNED) {
          kcalSum += value.toDouble();
        }
      }

      return DailyActivity(
        steps: stepsSum,
        kcal: kcalSum.round(),
      );
    } catch (e, stacktrace) {
      print('HealthService.readToday error: $e');
      print(stacktrace);
      return DailyActivity(steps: 0, kcal: 0);
    }
  }
}
