import 'package:travel_app_ui/constants.dart';

class CityModel {
  final String name;
  final String region;
  final dataTypes type = dataTypes.city;
  final String description;
  final String image;

  CityModel({
    required this.name,
    required this.region,
    required this.description,
    required this.image,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] as String,
      region: map['region'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }
}
