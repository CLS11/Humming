import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:humming/models/message.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //Sending messages
  Future<void> sendMessage(String receiverID, String message) async {
    //Fetching the user's information
    final currentUserID = _auth.currentUser!.uid;
    final currentUserEmail = _auth.currentUser!.email;
    //Fetching the timestamp
    final timeStamp = Timestamp.now();
    //Create a new message
    final newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail!,
      receiverID: receiverID,
      message: message,
      timeStamp: timeStamp,
    );
    //Making a chatroom
    final ids = <String>[currentUserID, receiverID]..sort();
    final chatRoomID = ids.join('_');
    await _firestore
        .collection('chatrooms')
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //Receiving messages
  Stream<QuerySnapshot> getMessages(String userID, String otherUserID) {
    //Creating a chatroom
    final ids = <String>[userID, otherUserID]..sort();
    final chatRoomID = ids.join('_');
    return _firestore
        .collection('chatrooms')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
