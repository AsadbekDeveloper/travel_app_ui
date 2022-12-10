import 'package:travel_app_ui/constants.dart';

class HolidayModel {
  final String name;
  final String date;
  final dataTypes type = dataTypes.holiday;
  final String description;
  final String image;

  HolidayModel({
    required this.name,
    required this.date,
    required this.description,
    required this.image,
  });

  factory HolidayModel.fromMap(Map<String, dynamic> map) {
    return HolidayModel(
      name: map['name'] as String,
      date: map['date'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }
}
