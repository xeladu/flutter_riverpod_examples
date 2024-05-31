// A simple model class with fromJson/toJson methods and Equatable for value comparison.
// A model is defined by what a repository returns. In this case, it's a Post with an id, title, and body.
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String title;
  final String body;

  const Post({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  @override
  List<Object?> get props => [id, title, body];
}
