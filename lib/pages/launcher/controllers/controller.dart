import 'package:auto_click_notification/AppRoutes.dart';
import 'package:get/get.dart';

import '../../BaseController.dart';

class LauncherController extends BaseController {
  @override
  void onReady() {
    super.onReady();
    Get.toNamed(AppRoutes.HOME);
  }
}
