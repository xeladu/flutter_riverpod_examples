// A controller manages the state of a widget and abstracts the business logic from the UI.

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/application/filter_option_provider.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/application/filter_service.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/domain/book.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/data/book_repository.dart';

// 4)
// This provider exposes the controller so that we can use it in our widget(s)
// Auto-dispose disposes of the controller when the widget is removed from the widget tree.
final bookFilterControllerProvider =
    AutoDisposeAsyncNotifierProvider<BookFilterController, List<Book>>(
        () => BookFilterController());

// 1)
// A controller always extends AsyncNotifier<T> where T is the type of data you have in your widget.
// In this case, we want a list of filtered books, so T is List<Book>
class BookFilterController extends AutoDisposeAsyncNotifier<List<Book>> {
  // 2)
  // The build method returns the default type for the controller (usually null, an empty list, or a default object).
  @override
  FutureOr<List<Book>> build() async {
    // 3)
    // But we can of course already listen to other providers and display data based on that.
    final books = await ref.read(bookRepositoryProvider).fetchBooks();
    final filter = ref.watch(filterOptionProvider);
    return await ref.read(filterServiceProvider).filterBooks(books, filter);
  }
}
