import 'dart:convert';

import 'package:amazing_app/functions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:amazing_app/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            child: AutoSizeText(
              inputText,
              maxLines: 10,
              minFontSize: 15,
              overflow: TextOverflow.ellipsis,
            ),
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
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      inputText += textController.text;
                      numberOfBytes = utf8.encode(inputText).length;
                    });
                    await prefs.setString('inputText', textController.text);
                  },
                  child: const Text("Enter")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      inputText = "";
                      numberOfBytes = 0;
                    });
                    await prefs.clear();
                  },
                  child: const Text("Clear")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      var tempText = prefs.getString('inputText');
                      if (tempText == null) {
                      } else {
                        inputText = tempText;
                        textController.text = tempText;
                      }
                      numberOfBytes = utf8.encode(inputText).length;
                    });
                  },
                  child: const Text("Load State")),
            )
          ]),
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
            child: SelectableText(getNumberOfBytes(numberOfBytes)),
          ),
        ],
      ),
    );
  }
}
