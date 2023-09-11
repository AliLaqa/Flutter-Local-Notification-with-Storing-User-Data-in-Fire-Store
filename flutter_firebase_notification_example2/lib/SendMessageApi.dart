import 'dart:convert';
import 'package:http/http.dart';

///TODO: Here we are making API to send to Firebase.
class SendMessageApi {
  Future<void> sendMessage(String token, String bodye,String title, String type) async {
    print("Sending notification...");

    final uri = Uri.parse('https://fcm.googleapis.com/fcm/send');

    ///TODO: we need to set Header as below and paste Authorization key from Firebase.
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=Please paste your Firebase messaging key here',
    };

    ///TODO: This is the body data which will be converted to JSON and then stored in a variable and assigned to below response.

    Map<String, dynamic> body = {
      "to": token.toString(),
      "notification": {
        "body": bodye.toString(),
        "title": title.toString(),
        "android_channel_id": "pushnotificationapp2",
        "sound": true,
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
      },
      "data": {
        "type": type,
        "id": "asif1234",
      },
    };

    ///TODO: Printing all information which is in body.
    print("operator$body");

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    ///Post API
    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    if (response.statusCode == 200) {
      print("Notification sent successfully.");
    } else {
      print("Failed to send notification. Status code: ${response.statusCode}");
    }
  }
}