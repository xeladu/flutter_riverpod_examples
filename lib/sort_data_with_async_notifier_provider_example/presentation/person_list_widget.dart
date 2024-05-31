import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/sort_data_with_async_notifier_provider_example/domain/sort.dart';
import 'package:riverpod_example/sort_data_with_async_notifier_provider_example/presentation/person_sort_controller.dart';

// 1)
// Riverpod providers are only available in a ConsumerWidget (replacement for StatelessWidget), a ConsumerStatefulWidget (replacement for StatefulWidget),
// or a Consumer widget that you can use inside your build method. With the `ref` parameter, you can access the providers.
class PersonListWidget extends ConsumerWidget {
  const PersonListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2)
    // We are watching the controller state (watch => rebuild widget when state changes, read => just give me the value once)
    // If it changes, the widget will rebuild with the new data (or error or loading state)
    final sortState = ref.watch(personSortControllerProvider);

    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
            onPressed: () => _sortById(ref), child: const Text("Sort by id")),
        ElevatedButton(
            onPressed: () => _sortByName(ref),
            child: const Text("Sort by name")),
        ElevatedButton(
            onPressed: () => _sortByAge(ref), child: const Text("Sort by age")),
      ]),
      // 3)
      // AsyncValue has three states: data, loading, and error
      // They are updated automatically so we don't need to worry about it here
      sortState.when(
          data: (data) => ListView(
              shrinkWrap: true,
              children: data
                  .map((item) => Text("${item.id}, ${item.name}, ${item.age}"))
                  .toList()),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text("Error: $error"))
    ]));
  }

  Future<void> _sortById(WidgetRef ref) async {
    // Call the controller to sort by id
    // A rebuild will be triggered with the new sort value
    ref.read(personSortControllerProvider.notifier).sortPersons(Sort.byId);
  }

  Future<void> _sortByName(WidgetRef ref) async {
    // Call the controller to sort by name
    // A rebuild will be triggered with the new sort value
    ref.read(personSortControllerProvider.notifier).sortPersons(Sort.byName);
  }

  Future<void> _sortByAge(WidgetRef ref) async {
    // Call the controller to sort by age
    // A rebuild will be triggered with the new sort value
    ref.read(personSortControllerProvider.notifier).sortPersons(Sort.byAge);
  }
}
