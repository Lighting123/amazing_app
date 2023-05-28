import 'package:flutter/material.dart';
import 'package:amazing_app/drawer.dart';

class MemorizeScreen extends StatelessWidget {
  const MemorizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memorize"),
      ),
      drawer: const Drawer(
        child: DrawerContent(),
      ),
      body: const Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("WILL BE REMOVED SOON")),
        ],
      ),
    );
  }
}
