import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:amazing_app/drawer.dart';

var inputText = "";
var numberOfBytes = 0;

class TextUtilitiesScreen extends StatefulWidget {
  const TextUtilitiesScreen({super.key});

  @override
  State<TextUtilitiesScreen> createState() => _TextUtilitiesScreenState();
}

class _TextUtilitiesScreenState extends State<TextUtilitiesScreen> {
  final textController = TextEditingController();

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
            child: SelectableText(inputText),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 4,
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter text',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    inputText += textController.text;
                    numberOfBytes = utf8.encode(inputText).length;
                  });
                },
                child: const Text("Enter")),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Number of characters: "),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(inputText.characters.length.toString()),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Bytes: "),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(numberOfBytes.toString()),
          ),
        ],
      ),
    );
  }
}
