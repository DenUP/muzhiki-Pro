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
    return const [
      City(
        name: 'Екатеринбург',
        branches: 62,
        bookingUrl: 'https://b953737.yclients.com/select-city?o=',
      ),
      City(
        name: 'Тюмень',
        branches: 37,
        bookingUrl: 'https://b952619.yclients.com/',
      ),
      City(
        name: 'Челябинск',
        branches: 16,
        bookingUrl: 'https://b951135.yclients.com/',
      ),
      City(
        name: 'Санкт-Петербург',
        branches: 15,
        bookingUrl: 'https://b1333810.yclients.com/',
      ),
      City(
        name: 'Пермь',
        branches: 6,
        bookingUrl:
            'https://b952621.yclients.com/select-city/29/select-branch?o=',
      ),
      City(
        name: 'Краснодар',
        branches: 5,
        bookingUrl:
            'https://b1172342.yclients.com/select-city/37/select-branch?o=',
      ),
      City(
        name: 'Новосибирск',
        branches: 4,
        bookingUrl:
            'https://b1146320.yclients.com/select-city/9/select-branch?o=',
      ),
      City(
        name: 'Казань',
        branches: 4,
        bookingUrl: 'https://b1172341.yclients.com/',
      ),
      City(
        name: 'Сочи',
        branches: 3,
        bookingUrl: 'https://b593983.yclients.com/',
      ),
      City(
        name: 'Уфа',
        branches: 3,
        bookingUrl: 'https://b1185496.yclients.com/',
      ),
      City(
        name: 'Верхняя Пышма',
        branches: 2,
        bookingUrl: 'https://b1605518.yclients.com/',
      ),
      City(
        name: 'Берёзовский',
        branches: 2,
        bookingUrl: 'https://b953739.yclients.com/',
      ),
      City(
        name: 'Нижний Новгород',
        branches: 2,
        bookingUrl:
            'https://b1267255.yclients.com/select-city/5/select-branch?o=',
      ),
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
      orElse: () => City(name: name, branches: 0, bookingUrl: ''),
    );
  }

  @override
  Future<bool> clearCity() async {
    return await prefs.clear();
  }
}
