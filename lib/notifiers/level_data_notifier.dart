import 'package:amazing_app/data_classes/level_data.dart';
import 'package:amazing_app/logging/battery_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LevelNotifier extends StateNotifier<List<LevelData>> {
  LevelNotifier() : super([]);

  void addLevel(LevelData level) {
    state = [...state, level];
    addLevelDataToLog(level);
  }

  Future<void> loadLevelData() async {
    var data = await readBatteryLevelDataFromLog();
    state = data;
  }

  Future<void> sortByday() async {
    var levelsByDay = <LevelData>[];
    var today = DateTime.now();
    state = await readBatteryLevelDataFromLog();

    for (var element in state) {
      var time = element.time;
      if (time.day == today.day &&
          time.month == today.month &&
          time.year == today.year) {
        levelsByDay.add(element);
      } else {}
    }

    state = levelsByDay;
  }

  Future<void> yesterdayFilter() async {
    var levelsYesterday = <LevelData>[];
    var today = DateTime.now();
    var yesterday = today.subtract(const Duration(days: 1));
    state = await readBatteryLevelDataFromLog();

    for (var element in state) {
      var time = element.time;
      if (time.day == yesterday.day &&
          time.month == yesterday.month &&
          time.year == yesterday.year) {
        levelsYesterday.add(element);
      } else {}
    }

    state = levelsYesterday;
  }
}
