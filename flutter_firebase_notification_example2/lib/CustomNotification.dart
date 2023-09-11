import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomNotification {
  static final _notification = FlutterLocalNotificationsPlugin();

  static Future init({bool scheduled = false}) async {
    var initAndroidSetting = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var ios = const DarwinInitializationSettings();
    final setting = InitializationSettings(android: initAndroidSetting, iOS: ios);
    await _notification.initialize(setting);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()!.requestPermission();
  }

///TODO:  Types of notification

  ///Notification for a New-Order.
  static void NewOrder(RemoteMessage message) async {
    try {
      Random random = Random();
      int id = random.nextInt(10000);
      NotificationDetails notificationDetails =
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp2",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,

          sound: RawResourceAndroidNotificationSound("loud"),
        ),
      );
      await _notification.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }

  ///Notification for a new Message.
  static void NewMessage(RemoteMessage message) async {
    try {
      Random random = Random();
      int id = random.nextInt(10000);
      const NotificationDetails notificationDetails =
      NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp7",
          "pushnotificationappchannel7",
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound("newsound"),
        ),
      );
      await _notification.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }

  ///Notification for Other things.
  static void Others(RemoteMessage message) async {
    try {
      Random random = Random();
      int id = random.nextInt(10000);
      const NotificationDetails notificationDetails =
      NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp6",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound("sms"),
        ),
      );
      await _notification.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }
}


/// BAck-up without payload
///
/// import 'dart:math';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class CustomNotification {
//   static final _notification = FlutterLocalNotificationsPlugin();
//
//   static Future init({bool scheduled = false}) async {
//     var initAndroidSetting = const AndroidInitializationSettings("@mipmap/ic_launcher");
//     var ios = const DarwinInitializationSettings();
//     final setting = InitializationSettings(android: initAndroidSetting, iOS: ios);
//     await _notification.initialize(setting);
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//     flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()!.requestPermission();
//   }
//
// ///TODO:  Types of notification
//
//   ///Notification for a New-Order.
//   static void NewOrder(RemoteMessage message) async {
//     try {
//       Random random = Random();
//       int id = random.nextInt(10000);
//       NotificationDetails notificationDetails =
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           "pushnotificationapp2",
//           "pushnotificationappchannel",
//           importance: Importance.max,
//           priority: Priority.high,
//
//           sound: RawResourceAndroidNotificationSound("loud"),
//         ),
//       );
//       await _notification.show(
//         id,
//         message.notification!.title,
//         message.notification!.body,
//         notificationDetails,
//         payload: message.data['_id'],
//       );
//     } on Exception catch (e) {
//       print('Error>>>$e');
//     }
//   }
//
//   ///Notification for a new Message.
//   static void NewMessage(RemoteMessage message) async {
//     try {
//       Random random = Random();
//       int id = random.nextInt(10000);
//       const NotificationDetails notificationDetails =
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           "pushnotificationapp7",
//           "pushnotificationappchannel7",
//           importance: Importance.max,
//           priority: Priority.high,
//           sound: RawResourceAndroidNotificationSound("newsound"),
//         ),
//       );
//       await _notification.show(
//         id,
//         message.notification!.title,
//         message.notification!.body,
//         notificationDetails,
//         payload: message.data['_id'],
//       );
//     } on Exception catch (e) {
//       print('Error>>>$e');
//     }
//   }
//
//   ///Notification for Other things.
//   static void Others(RemoteMessage message) async {
//     try {
//       Random random = Random();
//       int id = random.nextInt(10000);
//       const NotificationDetails notificationDetails =
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           "pushnotificationapp6",
//           "pushnotificationappchannel",
//           importance: Importance.max,
//           priority: Priority.high,
//           sound: RawResourceAndroidNotificationSound("sms"),
//         ),
//       );
//       await _notification.show(
//         id,
//         message.notification!.title,
//         message.notification!.body,
//         notificationDetails,
//         payload: message.data['_id'],
//       );
//     } on Exception catch (e) {
//       print('Error>>>$e');
//     }
//   }
// }