import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class LevelData {
  const LevelData(
      {required this.level, required this.time});

  // All properties should be `final` on our class.
  final int level;

  final DateTime time;


  // Since Todo is immutable, we implement a method that allows cloning the
  // Todo with slightly different content.
  LevelData copyWith({int? level, DateTime? time, String? batteryState}) {
    return LevelData(
      level: level ?? this.level,
      time: time ?? this.time,
    );
  }
}
