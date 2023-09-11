// /MessageScreen backup
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  ///We made a String "id" and passed it as required to show messages coming in notification payload and showed it in Text field below.
  ///The user is being redirected when tapping on notification using function "handleNotification" which is in NotificationScreen.
  final String id;
  const MessageScreen({super.key, required this.id});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Old Message "+widget.id),centerTitle: true,automaticallyImplyLeading: true,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/image_bg.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}

///Backup of Receiving message with notifications via Firebase.

// import 'package:flutter/material.dart';
//
// class MessageScreen extends StatefulWidget {
//   ///We made a String "id" and passed it as required to show messages coming in notification payload and showed it in Text field below.
//   ///The user is being redirected when tapping on notification using function "handleNotification" which is in NotificationScreen.
//   final String id;
//   const MessageScreen({super.key, required this.id});
//
//   @override
//   State<MessageScreen> createState() => _MessageScreenState();
// }
//
// class _MessageScreenState extends State<MessageScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Message Screen"+widget.id),centerTitle: true,automaticallyImplyLeading: true,),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage("assets/images/image_bg.jpg"),
//             fit: BoxFit.cover,
//             alignment: Alignment.center,
//           ),
//         ),
//         child: Column(
//           children: [
//
//           ],
//         ),
//       ),
//     );
//   }
// }
