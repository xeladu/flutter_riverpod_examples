import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final int id;
  final String name;
  final int age;

  const Person({
    required this.id,
    required this.name,
    required this.age,
  });

  @override
  List<Object?> get props => [id, name, age];

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
