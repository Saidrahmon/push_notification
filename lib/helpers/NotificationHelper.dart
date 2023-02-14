import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationHelper {

  static void initNotification() async {
    AwesomeNotifications().initialize(
      "resource://mipmap/ic_launcher",
      [
        NotificationChannel(
          channelKey: 'auto_click_notification',
          channelName: 'auto_click_notification',
          channelDescription: 'Auto_click_notification',
          ledColor: Colors.white,
          defaultColor: Colors.white,
          enableVibration: true,
          playSound: true,
          enableLights: true,
          importance: NotificationImportance.High,
        )
      ],
    );

    // AwesomeNotifications().ac.listen((event) {
    //   Logger().w(event.payload!);
    // });
  }
}
