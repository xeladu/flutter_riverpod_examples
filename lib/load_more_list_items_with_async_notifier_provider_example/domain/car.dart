import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final int horsepower;
  final String manufacturer;
  final String model;
  final int year;

  const Car({
    required this.horsepower,
    required this.manufacturer,
    required this.model,
    required this.year,
  });

  @override
  List<Object?> get props => [horsepower, manufacturer, model, year];

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      horsepower: json['horsepower'] as int,
      manufacturer: json['manufacturer'] as String,
      model: json['model'] as String,
      year: json['year'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'horsepower': horsepower,
      'manufacturer': manufacturer,
      'model': model,
      'year': year,
    };
  }
}
