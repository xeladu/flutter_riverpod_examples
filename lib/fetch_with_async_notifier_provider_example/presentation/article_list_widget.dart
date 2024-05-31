import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/fetch_with_async_notifier_provider_example/presentation/article_list_controller.dart';

// 1)
// Riverpod providers are only available in a ConsumerWidget (replacement for StatelessWidget), a ConsumerStatefulWidget (replacement for StatefulWidget),
// or a Consumer widget that you can use inside your build method. With the `ref` parameter, you can access the providers.
class ArticleListWidget extends ConsumerStatefulWidget {
  const ArticleListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<ArticleListWidget> {
  @override
  void initState() {
    super.initState();

    // 4)
    // We are calling the fetchArticles method from the controller to fetch the articles
    // If we had data push or event streaming of new articles to the app, the widget would automatically update with the new data.
    // Since we don't have that, we just fetch the articles once when the widget is created. Otherwise, we will only have an empty
    // list (default controller value).
    Future.delayed(const Duration(seconds: 1)).then((_) async =>
        await ref.read(articleListControllerProvider.notifier).fetchArticles());
  }

  @override
  Widget build(BuildContext context) {
    // 2)
    // We are watching the controller state (watch => rebuild widget when state changes, read => just give me the value once)
    // If it changes, the widget will rebuild with the new data (or error or loading state)
    final articleState = ref.watch(articleListControllerProvider);

    // 3)
    // AsyncValue has three states: data, loading, and error
    // They are updated automatically so we don't need to worry about it here
    return Scaffold(
        body: articleState.when(
            data: (data) => ListView(
                children: data.map((item) => Text(item.title)).toList()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) =>
                Center(child: Text('Error: $error'))));
  }
}
