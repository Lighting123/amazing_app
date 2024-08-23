import 'package:amazing_app/drawer.dart';
import 'package:amazing_app/screens/about_screen.dart';
import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1),
              child: Text("Welcome to my amazing app"),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutScreen()));
                  },
                  child: const Text("About")),
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
