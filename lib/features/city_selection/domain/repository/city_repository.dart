import 'package:muzhiki_pro/features/city_selection/domain/entities/city.dart';

abstract class CityRepository {
  List<City> getCities();
  Future<void> saveCity(City city);
  City? getSavedCity();
  Future<bool> clearCity();
}
