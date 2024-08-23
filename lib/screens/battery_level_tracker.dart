import 'package:amazing_app/data_classes/level_data.dart';
import 'package:amazing_app/drawer.dart';
import 'package:amazing_app/notifiers/level_data_notifier.dart';
import 'package:amazing_app/widgets/battery_level_widget.dart';
import 'package:amazing_app/widgets/view_widget.dart';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final listOfLevelsProvider =
    StateNotifierProvider<LevelNotifier, List<LevelData>>((ref) {
  return LevelNotifier();
});

class BatteryLevelTrackerScreen extends ConsumerWidget {
  const BatteryLevelTrackerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<LevelData> listOfLevels = ref.watch(listOfLevelsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Battery Level Tracker"),
      ),
      drawer: const Drawer(
        child: DrawerContent(),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const BatteryLevelWidget(),
            const ViewWidget(),
            Expanded(
                child: ListView.builder(
                    itemCount: listOfLevels.length,
                    itemBuilder: (context, index) {
                      var formattedDate =
                          DateFormat.yMMMEd().format(listOfLevels[index].time);
                      var formattedTime =
                          DateFormat.Hms().format(listOfLevels[index].time);
                      return ListTile(
                        title: Text("${listOfLevels[index].level}%"),
                        subtitle: Text(
                            "At $formattedDate on $formattedTime\nState: ${listOfLevels[index].batteryState}"),
                      );
                    })),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () async {
                          var battery = Battery();
                          var batteryLevel = await battery.batteryLevel;
                          var batteryState = await battery.batteryState;
                          var data = LevelData(
                              level: batteryLevel,
                              time: DateTime.now(),
                              batteryState: batteryState.name);

                          ref
                              .read(listOfLevelsProvider.notifier)
                              .addLevel(data);
                        },
                        child: const Text("Add Level")),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () async {
                          ref
                              .read(listOfLevelsProvider.notifier)
                              .loadLevelData();
                        },
                        child: const Text("Load Data")),
                  ),
                ),
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
          ])),
    );
  }
}
