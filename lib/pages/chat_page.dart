import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:humming/services/auth/auth_service.dart';
import 'package:humming/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  ChatPage({required this.receiverEmail, required this.receiverID, super.key});

  final String receiverEmail;
  final String receiverID;

  //Text Controller
  final TextEditingController _messageController = TextEditingController();

  //Services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //Sending a message
  Future<void> sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          receiverEmail,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(
              
            ),
          ),
        ],
      ),
    );
  }

  //Message list
  Widget _buildMessageList(String receiverID) {
  final senderID = _authService.getCurrentUser()!.uid;
  
  return StreamBuilder(
    stream: _chatService.getMessages(receiverID, senderID), 
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Text('Error');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text('Loading...');
      }

      return ListView(
        children: snapshot.data!.docs
            .map(_buildMessageItem)
            .toList(),
      );
    }
  );
}


  //Message Item
  Widget _buildMessageItem(DocumentSnapshot doc){
    
  }
}
