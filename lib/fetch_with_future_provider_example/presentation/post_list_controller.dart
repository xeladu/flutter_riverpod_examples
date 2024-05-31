// A controller manages the state of a widget and abstracts the business logic from the UI.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/fetch_with_future_provider_example/domain/post.dart';
import 'package:riverpod_example/fetch_with_future_provider_example/data/post_repository.dart';

// 1)
// This provider exposes the controller so that we can use it in our widget(s)
// Auto-dispose disposes of the controller when the widget is removed from the widget tree.
final postListControllerProvider = FutureProvider.autoDispose<List<Post>>(
    (ref) => ref.read(postRepositoryProvider).fetchPosts());
