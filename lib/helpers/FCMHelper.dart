import 'package:auto_click_notification/firebase_options.dart';
import 'package:auto_click_notification/helpers/NotificationHelper.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

class FCMHelper {
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    NotificationHelper.initNotification();

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: message.hashCode,
        channelKey: 'auto_click_notification',
        title: message.data['title'],
        body: message.data['body'],
        hideLargeIconOnExpand: true,
      ),
    );
    Logger().i(message.data);
  }

  static init() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}
