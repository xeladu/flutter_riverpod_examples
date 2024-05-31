// A repository is anything that brings data to our app. It could be a network call, a database call, or even a simple file read.
// Every repository has a provider that makes it available to the rest of the app.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/sort_data_with_async_notifier_provider_example/domain/person.dart';

// 2)
// This is the provider that exposes the repository to the rest of the app.
final personRepositoryProvider = Provider((ref) => PersonRepository());

// 1)
// This is the actual repository (database, REST API, static data, asset file, etc.)
class PersonRepository {
  Future<List<Person>> fetchPersons() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      const Person(id: 1, name: 'John Doe', age: 30),
      const Person(id: 2, name: 'Jane Doe', age: 25),
      const Person(id: 3, name: 'Alice', age: 35),
      const Person(id: 4, name: 'Bob', age: 40),
    ];
  }
}
