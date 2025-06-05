import 'package:flutter/material.dart';
import 'package:humming/auth/auth_service.dart';
import 'package:humming/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    final _auth = AuthService()
    ..signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child:  Text(
            'Home',
          ),
        ),
        actions: [
          IconButton(
            onPressed: logout, 
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
