import 'package:boozin_fitness/domain/entities/daily_activity.dart';
import 'package:boozin_fitness/domain/usecases/get_daily_activity.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  HomeController(this._usecase);
  final GetDailyActivity _usecase;

  final Rxn<DailyActivity> activity = Rxn();

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    activity.value = await _usecase();
  }
}
