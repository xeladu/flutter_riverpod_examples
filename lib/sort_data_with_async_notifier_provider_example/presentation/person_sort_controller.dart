// A controller manages the state of a widget and abstracts the business logic from the UI.

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/sort_data_with_async_notifier_provider_example/application/sort_service.dart';
import 'package:riverpod_example/sort_data_with_async_notifier_provider_example/domain/sort.dart';
import 'package:riverpod_example/sort_data_with_async_notifier_provider_example/domain/person.dart';

// 6)
// This provider exposes the controller so that we can use it in our widget(s)
// Auto-dispose disposes of the controller when the widget is removed from the widget tree.
final personSortControllerProvider =
    AutoDisposeAsyncNotifierProvider<PersonSortController, List<Person>>(
        () => PersonSortController());

// 1)
// A controller always extends AsyncNotifier<T> where T is the type of data you have in your widget.
// In this case, we want a list of sorted persons, so T is List<Person>
class PersonSortController extends AutoDisposeAsyncNotifier<List<Person>> {
  // 2)
  // The build method returns the default type for the controller (usually null, an empty list, or a default object).
  @override
  FutureOr<List<Person>> build() => [];

  // 3)
  // Here we sort the persons with the given parameter
  Future<void> sortPersons(Sort sort) async {
    // 4)
    // First, we set the state to loading
    state = const AsyncValue.loading();

    // 5)
    // Then, we set the state to data with the sorted persons by calling a service
    state = await AsyncValue.guard(
        () async => await ref.read(sortServiceProvider).sortPersons(sort));
  }
}
