import 'package:amazing_app/drawer.dart';
import 'package:amazing_app/widgets/battery_level_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatteryLevelTrackerScreen extends ConsumerWidget {
  const BatteryLevelTrackerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Battery Level Tracker"),
      ),
      drawer: const Drawer(
        child: DrawerContent(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BatteryLevelWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back")),
            ),
          ],
        ),
      ),
    );
  }
}
