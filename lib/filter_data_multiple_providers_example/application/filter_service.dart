import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/domain/book.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/domain/filter_option_enum.dart';

// 3)
// A provider to expose the service.
final filterServiceProvider = Provider<FilterService>((ref) {
  return FilterService();
});

// 1)
// A simple service that filters a list of books based on a filter option.
class FilterService {
  FilterService();

  // 2)
  // Note that this class doesn't have a ProviderRef injected, so we can't access other providers.
  Future<List<Book>> filterBooks(
      List<Book> books, FilterOptionEnum filter) async {
    switch (filter) {
      case FilterOptionEnum.priceMoreThan5:
        return books.where((book) => book.price > 5).toList();
      case FilterOptionEnum.priceMoreThan15:
        return books.where((book) => book.price > 15).toList();
      case FilterOptionEnum.priceMoreThan25:
        return books.where((book) => book.price > 25).toList();
      case FilterOptionEnum.priceMoreThan35:
        return books.where((book) => book.price > 35).toList();
    }
  }
}
