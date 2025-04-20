import 'package:boozin_fitness/presentation/splash/controllers/splash.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:boozin_fitness/presentation/theme/app_text.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final SplashController controller;
  late final AnimationController _animCtrl;
  late final List<Animation<double>> _letterAnims;
  final _text = "Fitness".split('');

  @override
  void initState() {
    super.initState();
    controller = Get.find<SplashController>();

    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    final count = _text.length;
    _letterAnims = List.generate(count, (i) {
      final start = i / count;
      final end = (i + 1) / count;
      return CurvedAnimation(
        parent: _animCtrl,
        curve: Interval(start, end, curve: Curves.easeOut),
      );
    });

    
    ever(controller.stage, (SplashStage stage) {
      if (stage == SplashStage.full) {
        _animCtrl.forward();
      }
    });
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  Widget _buildFullStage() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_text.length, (i) {
        return FadeTransition(
          opacity: _letterAnims[i],
          child: Text(
            _text[i],
            style: AppText.h3,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Obx(() {
          switch (controller.stage.value) {
            case SplashStage.icon:
              return Image.asset('assets/Boozin_Logo_start.png', width: 160);
            case SplashStage.logo:
              final logo = Get.isDarkMode
                  ? 'assets/Boozin_Logo_dark.png'
                  : 'assets/Boozin_Logo_for_white.png';
              return Image.asset(logo, width: 160);
            case SplashStage.full:
              
              final logoAsset = Get.isDarkMode
                  ? 'assets/Boozin_Logo_dark.png'
                  : 'assets/Boozin_Logo_for_white.png';
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(logoAsset, width: 160),
                  const SizedBox(height: 12),
                  _buildFullStage(),
                ],
              );
          }
        }),
      ),
    );
  }
}
