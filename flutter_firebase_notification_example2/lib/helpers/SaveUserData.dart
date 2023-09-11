import 'package:cloud_firestore/cloud_firestore.dart';
import 'GetToken.dart';

void saveUserDetail(String firstName, String lastName, String email, String phoneNo) {

  // Create a reference to the Firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('UserDetails');

// Add a new document to the collection with a unique ID
  String newDocumentId = users.doc().id; // generate a new unique ID and store it in a variable
  users
      .doc(newDocumentId) // use the generated ID to create a new document
      .set({
    'Id': newDocumentId, // add the generated ID as a field in the document
    "phone": phoneNo.toString(),
    "firstname": firstName.toString(),
    "lastname": lastName.toString(),
    "email": email.toString(),
    "isLogin": false,
    "UserPhoneToken": token.toString(),
  }).catchError((error) {

  });
  print("Saving User Data " + firstName.toString() + "---------------------------------->");
  print(GetToken().thisDeviceToken().toString());
}