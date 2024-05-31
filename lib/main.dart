import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/fetch_with_async_notifier_provider_example/presentation/article_list_widget.dart';
import 'package:riverpod_example/fetch_with_future_provider_example/presentation/post_list_widget.dart';
import 'package:riverpod_example/filter_data_multiple_providers_example/presentation/book_list_widget.dart';
import 'package:riverpod_example/load_more_list_items_with_async_notifier_provider_example/presentation/car_list_widget.dart';
import 'package:riverpod_example/refresh_list_items_with_future_provider_example/presentation/animal_list_widget.dart';
import 'package:riverpod_example/sort_data_with_async_notifier_provider_example/presentation/person_list_widget.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
            onPressed: () => _showFetchAsync(context),
            child: const Text("Fetch with AsyncNotifierProvider")),
        ElevatedButton(
            onPressed: () => _showFetchFuture(context),
            child: const Text("Fetch with FutureProvider")),
        ElevatedButton(
            onPressed: () => _showFilterMultiple(context),
            child: const Text("Filter data with multiple providers")),
        ElevatedButton(
            onPressed: () => _showSortAsync(context),
            child: const Text("Sort data with AsyncNotifierProvider")),
        ElevatedButton(
            onPressed: () => _showListLoadMore(context),
            child:
                const Text("Load more list items with AsyncNotifierProvider")),
        ElevatedButton(
            onPressed: () => _showListRefresh(context),
            child: const Text("Refresh list items with FutureProvider")),
      ]),
    ));
  }
}

void _showFetchAsync(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ArticleListWidget()),
  );
}

void _showFetchFuture(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const PostListWidget()),
  );
}

void _showFilterMultiple(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const BookListWidget()),
  );
}

void _showSortAsync(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const PersonListWidget()),
  );
}

void _showListLoadMore(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CarListWidget()),
  );
}

void _showListRefresh(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AnimalListWidget()),
  );
}
