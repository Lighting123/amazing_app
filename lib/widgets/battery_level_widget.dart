import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

class BatteryLevelWidget extends StatefulWidget {
  const BatteryLevelWidget({super.key});

  @override
  State<BatteryLevelWidget> createState() => _BatteryLevelWidgetState();
}

class _BatteryLevelWidgetState extends State<BatteryLevelWidget> {
  var battery = Battery();

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
    setBatteryLevel();
    setBatteryStatus();
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () async {
                    setBatteryLevel();
                    setBatteryStatus();
                  },
                  icon: const Icon(Icons.refresh_outlined)),
            )
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
      ],
    );
  }
}
