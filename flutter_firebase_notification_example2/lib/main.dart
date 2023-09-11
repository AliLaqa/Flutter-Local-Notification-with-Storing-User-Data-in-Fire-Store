import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_notification_example1/screens/homescreen.dart';
import 'CustomNotification.dart';
import 'helpers/notification_services.dart';

///To show notifications on background, this function needs to made a top level function
///means it needs to be made here always to work properly.
///pragma makes it entry point for our application as used below
@pragma('vm:entry-point') // You need to add this line for release mode notification in the background
Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  ///TODO: Here we are selecting the type of notification which we made in CustomNotification.dart
  ///We  have made three types of notifications in CustomNotification.dart file.
  if (message.notification!.title!.startsWith("Alert")) {
    CustomNotification.NewMessage(message);
  } else if (message.notification!.title!.startsWith("message")) {
    CustomNotification.Others(message);
  } else {
    CustomNotification.NewOrder(message);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ///Using above @pragma function which is used to get notifications in background mode.
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  ///For storing device token from Function _getToken below
  // String? _token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeMessaging();
    ///From NotificationServices page
    NotificationServices().getDeviceToken();
  }

  @override
  Widget build(BuildContext context) {
    CustomNotification.init();
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }

  Future<void> initializeMessaging() async {
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification!.title!.startsWith("Alert")) {
        CustomNotification.NewMessage(message);
      } else if (message.notification!.title!.startsWith("message")) {
        CustomNotification.Others(message);
      } else {
        CustomNotification.NewOrder(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification!.title!.startsWith("Alert")) {
        CustomNotification.NewMessage(message);
      } else if (message.notification!.title!.startsWith("message")) {
        CustomNotification.Others(message);
      } else {
        CustomNotification.NewOrder(message);
      }
    });
  }
}
