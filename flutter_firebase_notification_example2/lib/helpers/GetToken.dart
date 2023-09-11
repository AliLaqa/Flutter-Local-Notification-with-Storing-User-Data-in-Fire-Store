import 'package:firebase_messaging/firebase_messaging.dart';

String token = "";

class GetToken {

FirebaseMessaging messaging = FirebaseMessaging.instance;

Future<String> thisDeviceToken() async {
   token = (await messaging.getToken())!;
  return token;
}
}
