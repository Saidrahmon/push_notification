import 'package:auto_click_notification/AppRoutes.dart';
import 'package:auto_click_notification/pages/home/bindings/binding.dart';
import 'package:auto_click_notification/pages/home/views/view.dart';
import 'package:auto_click_notification/pages/launcher/views/view.dart';
import 'package:get/get.dart';

import 'pages/launcher/bindings/binding.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.BASE,
      page: () => const LauncherPage(),
      binding: LauncherBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
