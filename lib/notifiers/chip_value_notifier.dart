import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChipValueNotifier extends StateNotifier<bool> {
  ChipValueNotifier({required bool value}) : super(value);

  void toggle(bool value) {
    state = value;
  }
}
