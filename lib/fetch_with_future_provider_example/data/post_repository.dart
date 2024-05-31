// A repository is anything that brings data to our app. It could be a network call, a database call, or even a simple file read.
// Every repository has a provider that makes it available to the rest of the app.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/fetch_with_future_provider_example/domain/post.dart';

// 2)
// This is the provider that exposes the repository to the rest of the app.
final postRepositoryProvider = Provider((ref) => PostRepository());

// 1)
// This is the actual repository (database, REST API, static data, asset file, etc.)
class PostRepository {
  Future<List<Post>> fetchPosts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      const Post(
        id: "1",
        title: 'Article 1',
        body: 'This is article 1',
      ),
      const Post(
        id: "2",
        title: 'Article 2',
        body: 'This is article 2',
      ),
      const Post(
        id: "3",
        title: 'Article 3',
        body: 'This is article 3',
      ),
    ];
  }
}
