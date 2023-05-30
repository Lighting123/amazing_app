import 'package:amazing_app/drawer.dart';
import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1),
              child: Text("Welcome to my amazing app,\nEmmy's app"),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: OutlinedButton(onPressed: null, child: Text("About")),
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        child: DrawerContent(),
      ),
    );
  }
}
