import 'package:amazing_app/drawer.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Screen")),
      drawer: Drawer(child: const DrawerContent()),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Amazing App - V1.3.5"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "So many features built into one app.\n\nAmazing App 1.4 Goals:\n1. "),
          )
        ],
      ),
    );
  }
}
