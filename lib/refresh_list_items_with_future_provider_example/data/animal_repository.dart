// A repository is anything that brings data to our app. It could be a network call, a database call, or even a simple file read.
// Every repository has a provider that makes it available to the rest of the app.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/refresh_list_items_with_future_provider_example/domain/animal.dart';

// 2)
// This is the provider that exposes the repository to the rest of the app.
final animalRepositoryProvider = Provider((ref) => AnimalRepository());

// 1)
// This is the actual repository (database, REST API, static data, asset file, etc.)
class AnimalRepository {
  Future<List<Animal>> fetch() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Animal(name: 'Lion', age: DateTime.now().second, species: 'Panthera leo'),
      Animal(
          name: 'Elephant',
          age: DateTime.now().microsecond,
          species: 'Loxodonta africana'),
      Animal(
          name: 'Giraffe',
          age: DateTime.now().millisecond,
          species: 'Giraffa camelopardalis')
    ];
  }
}
