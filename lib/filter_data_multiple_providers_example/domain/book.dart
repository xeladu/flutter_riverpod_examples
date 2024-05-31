import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String title;
  final String author;
  final double price;

  const Book({
    required this.title,
    required this.author,
    required this.price,
  });

  @override
  List<Object?> get props => [title, author, price];

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String,
      author: json['author'] as String,
      price: json['price'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'price': price,
    };
  }
}
