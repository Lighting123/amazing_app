import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../data_classes/level_data.dart';

void addLevelDataToLog(LevelData data) async {
  final directory = await getApplicationDocumentsDirectory();

  var logFileName = '${directory.path}/battery_log.txt';
  var logFile = File(logFileName);
  logFile.writeAsString(
      "${data.level},${data.time.toIso8601String()},${data.batteryState}\n",
      mode: FileMode.append);
}

Future<List<LevelData>> readBatteryLevelDataFromLog() async {
  final directory = await getApplicationDocumentsDirectory();

  final file = File('${directory.path}/battery_log.txt');
  final lines = await file.readAsLines();

  final batteryLevels = lines.map((line) {
    final parts = line.split(',');

    final level = int.parse(parts[0]);
    final time = DateTime.parse(parts[1]);
    final status = parts[2];

    return LevelData(level: level, time: time, batteryState: status);
  }).toList();

  return batteryLevels;
}
