import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.message,
                color: Theme.of(context).colorScheme.primary,
                size: 64,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: const Text(
                'H O M E',
              ),
              leading: const Icon(
                Icons.home,
              ),
              onTap: (){},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: const Text(
                'S E T T I N G S',
              ),
              leading: const Icon(
                Icons.settings,
              ),
              onTap: (){},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: const Text(
                'L O G O U T',
              ),
              leading: const Icon(
                Icons.logout,
              ),
              onTap: (){},
            ),
          ),
        ],
      ),
    );
  }
}