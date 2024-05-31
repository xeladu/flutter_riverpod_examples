import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/fetch_with_future_provider_example/presentation/post_list_controller.dart';

// 1)
// Riverpod providers are only available in a ConsumerWidget (replacement for StatelessWidget), a ConsumerStatefulWidget (replacement for StatefulWidget),
// or a Consumer widget that you can use inside your build method. With the `ref` parameter, you can access the providers.
class PostListWidget extends ConsumerWidget {
  const PostListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2)
    // We are watching the controller state (watch => rebuild widget when state changes, read => just give me the value once)
    // If it changes, the widget will rebuild with the new data (or error or loading state)
    final postsState = ref.watch(postListControllerProvider);

    // 3)
    // AsyncValue has three states: data, loading, and error
    // They are updated automatically so we don't need to worry about it here
    return Scaffold(
        body: postsState.when(
            data: (data) => ListView(
                children: data.map((item) => Text(item.title)).toList()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) =>
                Center(child: Text('Error: $error'))));
  }
}
