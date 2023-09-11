import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_notification_example1/CustomNotification.dart';
import 'package:flutter_firebase_notification_example1/SendMessageApi.dart';
import 'package:flutter_firebase_notification_example1/helpers/GetToken.dart';
import 'package:flutter_firebase_notification_example1/helpers/SaveUserData.dart';
import 'package:flutter_firebase_notification_example1/helpers/notification_services.dart';

///Going to use http package to send request to server to send notification on button press.
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///Made instance of NotificationServices class to be used to get Device Token
  NotificationServices notificationServices = NotificationServices();

  ///TODO: For storing device token from Function _getToken below
  String? _token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///Requesting notification permission for Android and IOS using
    /// instance we made of NotificationServices class above.
    // notificationServices.requestNotificationPermission();

    ///Function to initialize function which shows notification when app is active made in NotificationServices page.
    notificationServices.firebaseInit(context);

    ///To interact with notification when app in background
    notificationServices.setupInteractMessage(context);

    ///Device-Token gets expired with time, so below we are initializing
    ///a function we made in notification file to get new token when the token expires.
    // notificationServices.isTokenRefresh();
    // CustomNotification customNotification = CustomNotification();
    // customNotification.init(context, message);
    _getToken();
  }


  ///TODO: Getting DeviceToken
  Future _getToken() async {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    String? token = await _firebaseMessaging.getToken();
    setState(() {
      _token = token;
    });
    print(_token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Notification"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue.shade200.withOpacity(0.8),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/image_bg.jpg"),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///TODO Alert Button
              // FilledButton(
              //   onPressed: () {
              //     ///Getting device token to send notification on the same device we are using.
              //     ///Using http package to send request server for notification.
              //     notificationServices.getDeviceToken().then((value) async {
              //
              //       ///To redirect the user on-tap we need to define and use payload,
              //       ///the parameter for payload is data, use as shown below.
              //
              //       var data = {
              //         'to': value.toString(),
              //         'notification': {
              //           'title': 'Alert',
              //           'body': 'Subscribe to my channel',
              //         },
              //         'data': {
              //           'type': 'msj',
              //           'id': 'asif1234'
              //         }
              //       };
              //       await http.post(
              //         Uri.parse('https://fcm.googleapis.com/fcm/send'),
              //
              //         ///TODO: we need to set Header as below and paste Authorization key from Firebase.
              //         ///If we make one mistake in header then our notifications will not work.
              //         headers: {
              //           'Content-Type': 'application/json',
              //           'Authorization':
              //               'key= Please enter Your Firebase Messaging key here'
              //         },
              //         body: jsonEncode(data),
              //       );
              //     });
              //   },
              //   child: Text("Alert"),
              // ),
              /// TODO: Message Button
              FilledButton(
                onPressed: () async {
                  String token = await GetToken().thisDeviceToken();
                  String title = "message";
                  String type = "msj";
                  String bodye = "Hello, this is a test notification"; // Specify the notification body here
                  SendMessageApi().sendMessage(token, bodye, title, type);
                },
                child: Text("Custom Notification"),
              ),
              ///Other
              /// TODO: Other Button
              FilledButton(
                onPressed: () async {
                  String token = await GetToken().thisDeviceToken();
                  String title = "message";
                  String type = "newmsj";
                  String bodye = "Hello, this is a test notification"; // Specify the notification body here
                  SendMessageApi().sendMessage(token, bodye, title, type);
                  saveUserDetail(
                      "Muhammad Ali",
                      "Laqa",
                      "Enter Email",
                      "Enter Phone number"
                  );
                },
                child: Text("Custom Notification"),
              )

            ],
          ),
        ),
      ),
    );
  }

}

// void _saveData() {
//
//     // Create a reference to the Firestorm collection
//     CollectionReference users = FirebaseFirestore.instance.collection('UserDetails');
//
// // Add a new document to the collection with a unique ID
//     String newDocumentId = users.doc().id; // generate a new unique ID and store it in a variable
//     users
//         .doc(newDocumentId) // use the generated ID to create a new document
//         .set({
//       'Id': newDocumentId, // add the generated ID as a field in the document
//       "phone": "03135",
//       "firstname": "ali",
//       "lastname": "laqa",
//     }).then((value) {
//     }
//     ).catchError((error) {
//
//     });
//   }

  ///Backup of add method
// Future<void> saveData() async {
//   print("jjdjfdfdj-------");
//   try {
//     await FirebaseFirestore.instance.collection('your_collection_name').add({
//       'field1': 'value1',
//       'field2': 'value2',
//       // Add more fields as needed
//     });
//     print('Data added successfully.');
//   } catch (e) {
//     print('Error adding data: $e');
//   }
// }


///Back-up before payload notification
// import 'dart:convert';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_notification_example1/SendMessageApi.dart';
// import 'package:flutter_firebase_notification_example1/helpers/notification_services.dart';
//
// ///Going to use http package to send request to server to send notification on button press.
// import 'package:http/http.dart' as http;
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   ///Made instance of NotificationServices class we made in notification_services file
//   NotificationServices notificationServices = NotificationServices();
//
//   ///TODO: For storing device token from Function _getToken below
//   String? _token;
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //
//   //   ///Requesting notification permission for Android and IOS using
//   //   /// instance we made of NotificationServices class above.
//   //   notificationServices.requestNotificationPermission();
//   //
//   //   ///Function to initialize function which shows notification when app is active made in NotificationServices page.
//   //   notificationServices.firebaseInit(context);
//   //
//   //   ///To interact with notification when app in background
//   //   notificationServices.setupInteractMessage(context);
//   //
//   //   ///Device-Token gets expired with time, so below we are initializing
//   //   ///a function we made in notification file to get new token when the token expires.
//   //   // notificationServices.isTokenRefresh();
//   //   notificationServices.getDeviceToken().then((value) => {
//   //         ///Here we are prining Token so we can see and add this device token on firebase.
//   //         print("Device Token"),
//   //         print(value),
//   //       });
//   // }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getToken();
//   }
//
//   ///TODO: Getting DeviceToken
//   Future _getToken() async {
//     FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//     String? token = await _firebaseMessaging.getToken();
//     setState(() {
//       _token = token;
//     });
//     print(_token);
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Firebase Notification"),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.lightBlue.shade200.withOpacity(0.8),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/image_bg.jpg"),
//               fit: BoxFit.cover,
//               alignment: Alignment.center,
//             )),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               FilledButton(
//                 onPressed: () {
//                   ///Getting device token to send notification on the same device we are using.
//                   ///Using http package to send request server for notification.
//                   notificationServices.getDeviceToken().then((value) async {
//
//                     ///To redirect the user on-tap we need to define and use payload,
//                     ///the parameter for payload is data, use as shown below.
//
//                     var data = {
//                       'to': value.toString(),
//                       'notification': {
//                         'title': 'Asif',
//                         'body': 'Subscribe to my channel',
//                       },
//                       'data': {
//                         'type': 'msj',
//                         'id': 'asif1234'
//                       }
//                     };
//
//                     ///The URL is from video and will be copied and pasted if needed for other projects.
//                     await http.post(
//                       Uri.parse('https://fcm.googleapis.com/fcm/send'),
//
//                       ///TODO: we need to set Header as below and paste Authorization key from Firebase.
//                       ///If we make one mistake in header then our notifications will not work.
//                       headers: {
//                         'Content-Type': 'application/json',
//                         'Authorization':
//                         'key=AAAABHfSHwc:APA91bG0-p1mOj_bvl_-U0YbakG_6EsAu8VRZD6MO0B9PqrW8i-J6d5N2HaxS972zGfDec2BYcSlSbk6kOzG9szdmsTTWu7ROA8rePNcD_CTo2lwYPtgHO8Q507KTpuEJyh7LIPhZ-D7'
//                       },
//                       ///We made var "data" above to pass it in body and applied jsonEncode method to convert
//                       ///our body data into json before posting it to server for notification.
//                       body: jsonEncode(data),
//                     );
//                   });
//                 },
//                 child: Text("Send Notifications"),
//               ),
//
//               /// TODO: Second Button
//               FilledButton(
//                 onPressed: () async {
//                   String token = await notificationServices.getDeviceToken();
//                   String bodye = "Hello, this is a test notification"; // Specify the notification body here
//                   SendMessageApi().sendMessage(token, bodye);
//                 },
//                 child: Text("Custom Notification"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
//
// class NotificationServices {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//
//
//   ///This function will get our Device-Token.
//   Future<String> getDeviceToken() async {
//     String? token = await messaging.getToken();
//     return token!;
//   }
// }