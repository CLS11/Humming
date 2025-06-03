import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({required this.text, super.key, this.onTap});

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
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
