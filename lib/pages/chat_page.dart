import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({required this.receiverEmail, super.key});

  final String receiverEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
        ),
      ),
    );
  }
}
