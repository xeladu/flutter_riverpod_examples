// A repository is anything that brings data to our app. It could be a network call, a database call, or even a simple file read.
// Every repository has a provider that makes it available to the rest of the app.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/load_more_list_items_with_async_notifier_provider_example/domain/car.dart';

// 2)
// This is the provider that exposes the repository to the rest of the app.
final carRepositoryProvider = Provider((ref) => CarRepository());

// 1)
// This is the actual repository (database, REST API, static data, asset file, etc.)
class CarRepository {
  Future<List<Car>> fetchCars(int howMany) async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(
        howMany,
        (index) => Car(
              horsepower: (index + 1) * 50,
              manufacturer: 'Brand ${index + 1}',
              model: 'Model ${index + 1}',
              year: 2022 - index,
            ));
  }
}
