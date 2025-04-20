
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThemeController extends GetxController {
  final mode = ThemeMode.system.obs;
  void toggle(bool isDark) => mode(isDark ? ThemeMode.dark : ThemeMode.light);
}
