import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:travel_app_ui/providers/city_model.dart';

class DataProvider extends ChangeNotifier {
  List<CityModel> _cities = [];
  List<CityModel> get cities => _cities;
  CityModel getCityByIndex(int index) {
    return _cities[index];
  }

  Future initializeCities() async {
    final String response =
        await rootBundle.loadString('assets/data/cities.json');
    final data = await jsonDecode(response);
    final cities = data["city"] as List;
    for (var city in cities) {
      _cities.add(CityModel.fromMap(city));
    }
    notifyListeners();
  }
}
