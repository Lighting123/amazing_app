import 'package:amazing_app/screens/battery_level_tracker.dart';
import 'package:amazing_app/notifiers/chip_value_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chipValue1Provider =
    StateNotifierProvider<ChipValueNotifier, bool>((ref) {
  return ChipValueNotifier(value: false);
});
final chipValue2Provider =
    StateNotifierProvider<ChipValueNotifier, bool>((ref) {
  return ChipValueNotifier(value: false);
});
final chipValue3Provider =
    StateNotifierProvider<ChipValueNotifier, bool>((ref) {
  return ChipValueNotifier(value: true);
});

class ViewWidget extends ConsumerWidget {
  const ViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chipValue1 = ref.watch(chipValue1Provider);
    var chipValue2 = ref.watch(chipValue2Provider);
    var chipValue3 = ref.watch(chipValue3Provider);

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: const Text("Today"),
            selected: chipValue1,
            onSelected: (value) {
              ref.read(chipValue1Provider.notifier).toggle(value);
              ref.read(chipValue2Provider.notifier).toggle(false);
              ref.read(chipValue3Provider.notifier).toggle(false);
              ref.read(listOfLevelsProvider.notifier).sortByday();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: const Text("Yesterday"),
            selected: chipValue2,
            onSelected: (value) {
              ref.read(chipValue2Provider.notifier).toggle(value);
              ref.read(chipValue1Provider.notifier).toggle(false);
              ref.read(chipValue3Provider.notifier).toggle(false);
            },
          ),
        ),
        ChoiceChip(
          label: const Text("All"),
          selected: chipValue3,
          onSelected: (value) {
            ref.read(chipValue3Provider.notifier).toggle(value);
            ref.read(chipValue2Provider.notifier).toggle(false);
            ref.read(chipValue1Provider.notifier).toggle(false);
            ref.read(listOfLevelsProvider.notifier).loadLevelData();
          },
        )
      ],
    );
  }
}
