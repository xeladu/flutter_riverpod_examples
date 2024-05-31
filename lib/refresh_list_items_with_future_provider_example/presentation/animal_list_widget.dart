import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/refresh_list_items_with_future_provider_example/presentation/animal_list_controller.dart';

// 1)
// Riverpod providers are only available in a ConsumerWidget (replacement for StatelessWidget), a ConsumerStatefulWidget (replacement for StatefulWidget),
// or a Consumer widget that you can use inside your build method. With the `ref` parameter, you can access the providers.
class AnimalListWidget extends ConsumerWidget {
  const AnimalListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2)
    // We are watching the controller state (watch => rebuild widget when state changes, read => just give me the value once)
    // If it changes, the widget will rebuild with the new data (or error or loading state)
    final animalState = ref.watch(animalListControllerProvider);

    return Scaffold(
        body:
            // 3)
            // AsyncValue has three states: data, loading, and error
            // They are updated automatically so we don't need to worry about it here
            animalState.when(
                // 6)
                // We need to set this property to false so that we can see the loading state when we refresh the provider
                // Otherwise, new values will just appear when they are fetched.
                skipLoadingOnRefresh: false,
                data: (data) => Column(children: [
                      ListView(
                          shrinkWrap: true,
                          children: data
                              .map((item) => Text(
                                  "${item.name}, ${item.age}, ${item.species}"))
                              .toList()),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () => _refresh(ref),
                          child: const Text("Refresh")),
                    ]),
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text("Error: $error")));
  }

  // 4)
  // This refreshes the provider, which will automatically fetch new data.
  void _refresh(WidgetRef ref) {
    // 5)
    // Use ref.invalidate if you just want the provider to refresh
    // Use ref.refresh if you want to refresh the provider and get the new value
    ref.invalidate(animalListControllerProvider);
  }
}
