import 'package:boozin_fitness/presentation/home/controllers/home.controller.dart';
import 'package:boozin_fitness/presentation/theme/app_colors.dart';
import 'package:boozin_fitness/presentation/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text('Hi!', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 32),

            // Steps card
            Obx(() => _metric(
                  label: 'Steps',
                  value: controller.activity.value?.steps ?? 0,
                  goal: 15000,
                  darkIcon: 'assets/ion_footsteps_for_dark.png',
                  lightIcon: 'assets/ion_footsteps_for_white.png',
                )),

            const SizedBox(height: 20),

            // Calories card
            Obx(() => _metric(
                  label: 'Calories Burned',
                  value: controller.activity.value?.kcal ?? 0,
                  goal: 1000,
                  darkIcon: 'assets/kcal_for_dark.png',
                  lightIcon: 'assets/kcal_for_white.png',
                )),
          ],
        ),
      ),
    );
  }

  Widget _metric({
  required String label,
  required int value,
  required int goal,
  required String darkIcon,
  required String lightIcon,
}) {
  final isDark = Get.isDarkMode;
  final pct    = (value / goal).clamp(0.0, 1.0);
  final icon   = isDark ? darkIcon : lightIcon;

  return Card(
    color: isDark ? AppColors.cardDark : AppColors.cardLight,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(
                  '$label: $value',
                  style: AppText.bodyBold.copyWith(
                      color: isDark
                          ? AppColors.textDark
                          : AppColors.textLight),
                ),
                const SizedBox(height: 12),

                
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    minHeight: 12,
                    value: pct,
                    backgroundColor: isDark
                        ? AppColors.remainDark
                        : AppColors.remainLight,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isDark ? AppColors.fillDark : AppColors.fillLight,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '0',
                      style: AppText.body.copyWith(
                          color: isDark
                              ? AppColors.textDark
                              : AppColors.textLight),
                    ),
                    Text(
                      'Goal: $goal',
                      style: AppText.body.copyWith(
                          color: isDark
                              ? AppColors.textDark
                              : AppColors.textLight),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),
         
          Image.asset(
            icon,
            width: 36,
            height: 36,
          ),
        ],
      ),
    ),
  );
}}