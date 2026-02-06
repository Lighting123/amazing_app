import 'dart:async';

import 'package:amazing_app/data_classes/level_data.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

class BatteryLevelWidget extends StatefulWidget {
  const BatteryLevelWidget({super.key});

  @override
  State<BatteryLevelWidget> createState() => _BatteryLevelWidgetState();
}

class _BatteryLevelWidgetState extends State<BatteryLevelWidget> {
  var battery = Battery();
  Timer? _timer;
  var avg_Level_Change_Per_Hour = ValueNotifier(0.0);
  var levels = <LevelData>[];
  var timeBetweenLevelsSecs = <int>[];

  var batteryLevel = ValueNotifier(0);
  BatteryState batteryStatus = BatteryState.unknown;

  Future<void> setBatteryLevel() async {
    batteryLevel.value = await battery.batteryLevel;
  }

  Future<void> setBatteryStatus() async {
    batteryStatus = await battery.batteryState;
  }

  @override
  void initState() {
    super.initState();
    // Run every second
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      var timeTogether = 0;
      // Your code here
      if (batteryLevel.value != await battery.batteryLevel) {
        setBatteryLevel();
        setBatteryStatus();
        levels.add(
            LevelData(level: await battery.batteryLevel, time: DateTime.now()));
        levels.asMap().forEach((index, value) {
          if (index == 0) {
          } else {
            var timeInBetween = levels[index - 1].time;
            var difference = const Duration();
            difference = value.time.difference(timeInBetween);
            timeBetweenLevelsSecs.add(difference.inSeconds);
          }
        });
        timeBetweenLevelsSecs.asMap().forEach((index, value) {
          timeTogether += value;
        });

        avg_Level_Change_Per_Hour.value = 60 * 60 / (timeTogether / levels.length);
        
      }
      print(avg_Level_Change_Per_Hour.value);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: batteryLevel,
                  builder: (context, count, _) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Current battery level is ${batteryLevel.value.toString()}%",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  }),
            ),
          ],
        ),
        ValueListenableBuilder(
            valueListenable: batteryLevel,
            builder: (context, count, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("State: ${batteryStatus.name}"),
              );
            }),
        ValueListenableBuilder(
            valueListenable: avg_Level_Change_Per_Hour,
            builder: (context, count, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Avg battery level change per hour: ${avg_Level_Change_Per_Hour.value.toStringAsFixed(2)}%/hr"),
              );
            })
      ],
    );
  }
}
