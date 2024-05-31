// A controller manages the state of a widget and abstracts the business logic from the UI.

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/load_more_list_items_with_async_notifier_provider_example/application/fetch_count_provider.dart';
import 'package:riverpod_example/load_more_list_items_with_async_notifier_provider_example/domain/car.dart';
import 'package:riverpod_example/load_more_list_items_with_async_notifier_provider_example/data/car_repository.dart';

// 4)
// This provider exposes the controller so that we can use it in our widget(s)
// Auto-dispose disposes of the controller when the widget is removed from the widget tree.
final carListControllerProvider =
    AutoDisposeAsyncNotifierProvider<CarListController, List<Car>>(
        () => CarListController());

// 1)
// A controller always extends AsyncNotifier<T> where T is the type of data you have in your widget.
// In this case, we want a list of cars, so T is List<Car>
class CarListController extends AutoDisposeAsyncNotifier<List<Car>> {
  // 2)
  // The build method returns the default type for the controller (usually null, an empty list, or a default object).
  @override
  FutureOr<List<Car>> build() async {
    // 3)
    // But we can of course already listen to other providers and display data based on that.
    final itemsCount = ref.watch(fetchCountProvider);
    final repository = ref.read(carRepositoryProvider);
    return await repository.fetchCars(itemsCount);
  }
}
