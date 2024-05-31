import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/sort_data_with_async_notifier_provider_example/domain/person.dart';
import 'package:riverpod_example/sort_data_with_async_notifier_provider_example/domain/sort.dart';
import 'package:riverpod_example/sort_data_with_async_notifier_provider_example/data/person_repository.dart';

// 4)
// A provider to expose the service
final sortServiceProvider = Provider((ref) => SortService(ref));

// 1)
// A simple service that sorts a list of persons based on a given parameter
class SortService {
  // 2)
  // We pass in a ProviderRef so that we can access other providers
  final ProviderRef ref;

  SortService(this.ref);

  Future<List<Person>> sortPersons(Sort sort) async {
    // 3)
    // Here we access the person repository with a provider
    final allPersons = await ref.read(personRepositoryProvider).fetchPersons();

    switch (sort) {
      case Sort.byName:
        allPersons.sort((a, b) => a.name.compareTo(b.name));
      case Sort.byAge:
        allPersons.sort((a, b) => a.age.compareTo(b.age));
      case Sort.byId:
        allPersons.sort((a, b) => a.id.compareTo(b.id));
    }

    return allPersons;
  }
}
