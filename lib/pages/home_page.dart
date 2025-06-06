import 'package:flutter/material.dart';
import 'package:humming/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child:  Text(
            'Home',
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
