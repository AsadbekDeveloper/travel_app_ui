class CityModel {
  final String name;
  final String region;
  final String type;
  final String description;
  final String image;

  CityModel({
    required this.name,
    required this.region,
    required this.type,
    required this.description,
    required this.image,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] as String,
      region: map['region'] as String,
      type: map['type'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }
}
