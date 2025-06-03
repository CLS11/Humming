import 'package:flutter/material.dart';
import 'package:humming/components/my_button.dart';
import 'package:humming/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();


  void register(){}
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),
            Text(
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 25),
            MyTextfield(
              hintText: 'Email', 
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: 'Password', 
              obscureText: false,
              controller: _pwController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextfield(
              hintText: 'Confirm Password', 
              obscureText: false,
              controller: _confirmpwController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Register',
              onTap: register,
            ),
             const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login Now!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
