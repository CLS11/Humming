import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({required this.text, super.key, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.person,
            ),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }
}
