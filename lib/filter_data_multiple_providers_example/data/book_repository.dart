// A repository is anything that brings data to our app. It could be a network call, a database call, or even a simple file read.
// Every repository has a provider that makes it available to the rest of the app.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/domain/book.dart';

// 2)
// This is the provider that exposes the repository to the rest of the app.
final bookRepositoryProvider = Provider<BookRepository>((ref) {
  return BookRepository();
});

// 1)
// This is the actual repository (database, REST API, static data, asset file, etc.)
class BookRepository {
  Future<List<Book>> fetchBooks() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      const Book(title: 'Book 1', author: 'Author 1', price: 9.99),
      const Book(title: 'Book 2', author: 'Author 2', price: 19.99),
      const Book(title: 'Book 3', author: 'Author 3', price: 29.99),
      const Book(title: 'Book 4', author: 'Author 4', price: 39.99),
    ];
  }
}
