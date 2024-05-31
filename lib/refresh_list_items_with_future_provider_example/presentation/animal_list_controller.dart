// A controller manages the state of a widget and abstracts the business logic from the UI.
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_example/refresh_list_items_with_future_provider_example/domain/animal.dart';
import 'package:riverpod_example/refresh_list_items_with_future_provider_example/data/animal_repository.dart';

// 1)
// This provider exposes the controller so that we can use it in our widget(s)
// Auto-dispose disposes of the controller when the widget is removed from the widget tree.
final animalListControllerProvider = FutureProvider.autoDispose<List<Animal>>(
    (ref) async => await ref.read(animalRepositoryProvider).fetch());
