import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:humming/auth/login_or_register.dart';
import 'package:humming/firebase_options.dart';
import 'package:humming/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Humming());
}

class Humming extends StatelessWidget {
  const Humming({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: lightMode,
    );
  }
}
