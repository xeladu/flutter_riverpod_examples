import 'package:equatable/equatable.dart';

class Animal extends Equatable {
  final String name;
  final int age;
  final String species;

  const Animal({
    required this.name,
    required this.age,
    required this.species,
  });

  @override
  List<Object?> get props => [name, age, species];

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      name: json['name'] as String,
      age: json['age'] as int,
      species: json['species'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'species': species,
    };
  }
}
