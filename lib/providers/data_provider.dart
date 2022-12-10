import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:travel_app_ui/providers/city_model.dart';
import 'package:travel_app_ui/providers/holiday_model.dart';

class DataProvider extends ChangeNotifier {
  List<CityModel> _cities = [];
  List<CityModel> get cities => _cities;
  List<HolidayModel> _holidays = [];
  List<HolidayModel> get holidays => _holidays;
  CityModel getCityByIndex(int index) {
    return _cities[index];
  }

  HolidayModel getHolidayByIndex(int index) {
    return _holidays[index];
  }

  List getDataByIndex(int index) {
    switch (index) {
      case 0:
        return _cities;
      case 1:
        return _holidays;
    }
    return _cities;
  }

  Future initializeData() async {
    final String response =
        await rootBundle.loadString('assets/data/cities.json');
    final data = await jsonDecode(response);
    final cityData = data["city"] as List;
    final holidayData = data["holiday"] as List;
    for (var city in cityData) {
      _cities.add(CityModel.fromMap(city));
    }
    for (var holiday in holidayData) {
      _holidays.add(HolidayModel.fromMap(holiday));
    }
    notifyListeners();
  }
}
