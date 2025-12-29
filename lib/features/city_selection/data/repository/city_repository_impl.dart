import 'dart:async';

import 'package:muzhiki_pro/features/city_selection/domain/entities/city.dart';
import 'package:muzhiki_pro/features/city_selection/domain/repository/city_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityRepositoryImpl implements CityRepository {
  final SharedPreferences prefs;

  CityRepositoryImpl(this.prefs);

  static const _cityKey = 'selected_city';

  @override
  List<City> getCities() {
    return [
      City(name: 'Москва', branches: 147),
      City(name: 'Санкт-Петербург', branches: 13),
      City(name: 'Омск', branches: 2),
      City(name: 'Екатеринбург', branches: 2),
      City(name: 'Рязань', branches: 1),
      City(name: 'Казань', branches: 1),
      City(name: 'Рязань', branches: 1),
      City(name: 'Казань', branches: 1),
      City(name: 'Рязань', branches: 1),
      City(name: 'Казань', branches: 1),
      City(name: 'Рязань', branches: 1),
      City(name: 'Казань', branches: 1),
    ];
  }

  @override
  Future<void> saveCity(City city) async {
    await prefs.setString(_cityKey, city.name);
  }

  @override
  City? getSavedCity() {
    final name = prefs.getString(_cityKey);
    if (name == null) return null;

    return getCities().firstWhere(
      (c) => c.name == name,
      orElse: () => City(name: name, branches: 0),
    );
  }

  @override
  Future<bool> clearCity() async {
    return await prefs.clear();
  }
}
