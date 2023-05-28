import 'package:flutter/material.dart';
import 'package:amazing_app/drawer.dart';

var inputText = "";

class TextUtilitiesScreen extends StatefulWidget {
  const TextUtilitiesScreen({super.key});

  @override
  State<TextUtilitiesScreen> createState() => _TextUtilitiesScreenState();
}

class _TextUtilitiesScreenState extends State<TextUtilitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Utilities"),
      ),
      drawer: const Drawer(
        child: DrawerContent(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Text:"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(inputText),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter text',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: OutlinedButton(onPressed: null, child: Text("Enter")),
          )
        ],
      ),
    );
  }
}
