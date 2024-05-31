// A simple model class with fromJson/toJson methods and Equatable for value comparison.
// A model is defined by what a repository returns. In this case, it's an Article with an id, title, and body.
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String body;

  const Article({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
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
