// A controller manages the state of a widget and abstracts the business logic from the UI.

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/fetch_with_async_notifier_provider_example/domain/article.dart';
import 'package:riverpod_example/fetch_with_async_notifier_provider_example/data/article_repository.dart';

// 6)
// This provider exposes the controller so that we can use it in our widget(s)
// Auto-dispose disposes of the controller when the widget is removed from the widget tree.
final articleListControllerProvider =
    AsyncNotifierProvider.autoDispose<ArticleListController, List<Article>>(
        () => ArticleListController());

// 1)
// A controller always extends AsyncNotifier<T> where T is the type of data you have in your widget.
// In this case, we want a list of articles, so T is List<Article>
class ArticleListController extends AutoDisposeAsyncNotifier<List<Article>> {
  // 2)
  // The build method returns the default type for the controller (usually null, an empty list, or a default object).
  @override
  FutureOr<List<Article>> build() => [];

  // 3)
  // Here we fetch the articles from the repository and update the state of the controller.
  Future<void> fetchArticles() async {
    // 4)
    // first, we set the state to loading
    state = const AsyncValue.loading();

    // 5)
    // then we fetch the articles by accessing our repository through the exposed provider.
    // AsyncValue.guard is a helper method that catches any errors and sets the state to error if there are any.
    // => https://codewithandrea.com/tips/async-value-guard-try-catch/
    state = await AsyncValue.guard(
        ref.read(articleRepositoryProvider).fetchArticles);
  }
}
