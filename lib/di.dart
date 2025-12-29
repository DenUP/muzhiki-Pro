import 'package:get_it/get_it.dart';
import 'package:muzhiki_pro/features/city_selection/data/repository/city_repository_impl.dart';
import 'package:muzhiki_pro/features/city_selection/domain/repository/city_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDi() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerLazySingleton<CityRepository>(
    () => CityRepositoryImpl(getIt()),
  );
}
