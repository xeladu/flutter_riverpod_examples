import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/application/filter_option_provider.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/domain/filter_option_enum.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/presentation/book_filter_controller.dart';

// 1)
// Riverpod providers are only available in a ConsumerWidget (replacement for StatelessWidget), a ConsumerStatefulWidget (replacement for StatefulWidget),
// or a Consumer widget that you can use inside your build method. With the `ref` parameter, you can access the providers.
class BookListWidget extends ConsumerWidget {
  const BookListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2)
    // We are watching the controller state (watch => rebuild widget when state changes, read => just give me the value once)
    // If it changes, the widget will rebuild with the new data (or error or loading state)
    final filterState = ref.watch(bookFilterControllerProvider);

    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
            onPressed: () => _setFilter(ref, FilterOptionEnum.priceMoreThan5),
            child: const Text("Show books over 5€")),
        ElevatedButton(
            onPressed: () => _setFilter(ref, FilterOptionEnum.priceMoreThan15),
            child: const Text("Show books over 15€")),
        ElevatedButton(
            onPressed: () => _setFilter(ref, FilterOptionEnum.priceMoreThan25),
            child: const Text("Show books over 25€")),
        ElevatedButton(
            onPressed: () => _setFilter(ref, FilterOptionEnum.priceMoreThan35),
            child: const Text("Show books over 35€")),
      ]),
      // 3)
      // AsyncValue has three states: data, loading, and error
      // They are updated automatically so we don't need to worry about it here
      filterState.when(
          data: (books) => ListView(
              shrinkWrap: true,
              children: books
                  .map((item) =>
                      Text("${item.title}, ${item.author}, ${item.price}"))
                  .toList()),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text("Error: $error"))
    ]));
  }

  Future<void> _setFilter(WidgetRef ref, FilterOptionEnum filter) async {
    // set the filter
    ref.read(filterOptionProvider.notifier).setFilter(filter);

    // the controller is automatically triggered because it watches the filterOptionProvider!
  }
}
