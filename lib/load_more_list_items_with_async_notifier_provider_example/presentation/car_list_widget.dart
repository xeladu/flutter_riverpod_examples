import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/load_more_list_items_with_async_notifier_provider_example/application/fetch_count_provider.dart';
import 'package:riverpod_example/load_more_list_items_with_async_notifier_provider_example/presentation/car_list_controller.dart';

// 1)
// Riverpod providers are only available in a ConsumerWidget (replacement for StatelessWidget), a ConsumerStatefulWidget (replacement for StatefulWidget),
// or a Consumer widget that you can use inside your build method. With the `ref` parameter, you can access the providers.
class CarListWidget extends ConsumerWidget {
  const CarListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2)
    // We are watching the controller state (watch => rebuild widget when state changes, read => just give me the value once)
    // If it changes, the widget will rebuild with the new data (or error or loading state)
    final carState = ref.watch(carListControllerProvider);

    return Scaffold(
        body:
            // 3)
            // AsyncValue has three states: data, loading, and error
            // They are updated automatically so we don't need to worry about it here
            carState.when(
                data: (data) => Column(children: [
                      ListView(
                          shrinkWrap: true,
                          children: data
                              .map((item) => Text(
                                  "${item.manufacturer}, ${item.horsepower}, ${item.model}, ${item.year}"))
                              .toList()),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () => _loadMoreItems(ref),
                          child: const Text("Load more items")),
                    ]),
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text("Error: $error")));
  }

  // 4)
  // To load more items, we increase the fetchCountProvider. The carListControllerProvider
  // will automatically update and fetch more data.
  void _loadMoreItems(WidgetRef ref) {
    ref.read(fetchCountProvider.notifier).incBy5();
  }
}
