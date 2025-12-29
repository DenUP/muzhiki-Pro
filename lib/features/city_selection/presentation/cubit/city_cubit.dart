import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muzhiki_pro/features/city_selection/domain/entities/city.dart';
import 'package:muzhiki_pro/features/city_selection/domain/repository/city_repository.dart';
import 'package:muzhiki_pro/features/city_selection/presentation/cubit/city_state.dart';

class CityCubit extends Cubit<CityState> {
  final CityRepository repository;

  CityCubit(this.repository) : super(CityState(repository.getCities()));

  Future<void> selectCity(City city) async {
    await repository.saveCity(city);
  }
}
