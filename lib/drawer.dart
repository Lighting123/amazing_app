import 'package:amazing_app/screens/attempts_recorder_screen.dart';
import 'package:amazing_app/screens/battery_level_tracker.dart';
import 'package:amazing_app/screens/memorize_screen.dart';
import 'package:amazing_app/screens/text_utils_screen.dart';
import 'package:amazing_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key}) : super(key: key);

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
              Icons.restart_alt,
              color: Colors.deepOrange,
            ),
            title: const Text("Memorize"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MemorizeScreen()));
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
        ],
      ))
    ]);
  }
}
