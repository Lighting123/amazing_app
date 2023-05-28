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

  void sortByday() {
    var levelsByDay = <LevelData>[];
    var today = DateTime.now();

    for (var element in state) {
      if (element.time.day == today.day) {
        levelsByDay.add(element);
      } else {}
    }

    state = levelsByDay;
  }

  // void removeTodo(String todoId) {
  // state = [
  // for (final todo in state)
  // if (todo.id != todoId) todo,
  // ];
  // }
}
