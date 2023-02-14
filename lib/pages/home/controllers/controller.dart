import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

import '../../BaseController.dart';

class HomeController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    initMessaging();
  }

  void initMessaging() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission();
    }

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        Logger().w(message.data);
      }
    });

    /// While you in-app once receive message triggers the method you should add your custom notification here also
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      Logger().w(message.data);
    });
    FirebaseMessaging.instance.subscribeToTopic('test'); // subscribe to topic test
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Logger().i(message.data);
    });

    getToken();
  }

  void getToken() {
    FirebaseMessaging.instance.getToken.call().then((token) {
      Logger().i(token);
    });
  }
}
