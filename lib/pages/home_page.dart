import 'package:flutter/material.dart';
import 'package:humming/components/my_drawer.dart';
import 'package:humming/components/user_tile.dart';
import 'package:humming/pages/chat_page.dart';
import 'package:humming/services/auth/auth_service.dart';
import 'package:humming/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Home'))),
      drawer: const MyDrawer(),
      body: buildUserList(),
    );
  }

  Widget buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        final users = List<Map<String, String>>.from(snapshot.data!);
        return ListView(
          children:
              users
                  .map<Widget>(
                    (userData) => _buildUserListItem(userData, context),
                  )
                  .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
    Map<String, String> userData,
    BuildContext context,
  ) {
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData['email'] ?? 'No email',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      ChatPage(
                        receiverEmail: userData['email'] ?? 'No email',
                        receiverID: userData['uid'] ?? 'No ID',
                      ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
