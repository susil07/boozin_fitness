import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}



class Navigation {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.SPLASH,
      page: () =>  SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () =>  HomeScreen(),
      binding: HomeControllerBinding(),
    ),
  ];
}

