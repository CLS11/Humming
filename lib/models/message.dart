import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
   Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timeStamp
  });

  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timeStamp;

  //Conversion to a map
  Map<String, dynamic> toMap(){
    return {
      'senderID' : senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'message': message,
      'timeStamp': timeStamp,
    };
  }
}
