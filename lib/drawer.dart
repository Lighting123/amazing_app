import 'package:amazing_app/screens/attempts_recorder_screen.dart';
import 'package:amazing_app/screens/battery_level_tracker.dart';
import 'package:amazing_app/screens/text_utils_screen.dart';
import 'package:amazing_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'screens/guess_the_number_game.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: ListView(
        children: [
          ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: const Text("Home"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FirstRoute()));
              }),
          ListTile(
              leading: const Icon(
                Icons.alarm_rounded,
                color: Colors.red,
              ),
              title: const Text("Attempts Screen"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AttemptsRecorder()));
              }),
          ListTile(
            leading: const Icon(
              Icons.battery_charging_full_rounded,
              color: Colors.amber,
            ),
            title: const Text("Battery Level Tracker"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BatteryLevelTrackerScreen()));
            },
          ),
          ListTile(
              leading: const Icon(
                Icons.text_fields,
                color: Colors.green,
              ),
              title: const Text("Text Utilities"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TextUtilitiesScreen()));
              }),
              ListTile(
                leading: const Icon(
                  Icons.numbers_outlined,
                ),
                title: const Text("Guess the number game"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GuessTheNumberGame()));
                }),
            
        ],
      ))
    ]);
  }
}
