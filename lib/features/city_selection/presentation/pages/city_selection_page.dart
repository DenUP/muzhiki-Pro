import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muzhiki_pro/di.dart';
import 'package:muzhiki_pro/features/city_selection/domain/entities/city.dart';
import 'package:muzhiki_pro/features/city_selection/presentation/cubit/city_cubit.dart';

class CitySelectionPage extends StatelessWidget {
  const CitySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CityCubit(getIt()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: MediaQuery.of(context).size.height * 0.001,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [_HeaderImage(), _Title(), _CityList()],
          ),
        ),
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: Image.asset('assets/splash/background.jpg', fit: BoxFit.cover),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Text(
        'Выберите город',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _CityList extends StatelessWidget {
  const _CityList();

  @override
  Widget build(BuildContext context) {
    final cities = context.watch<CityCubit>().state.cities;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: cities.map((city) {
          return _CityTile(city: city);
        }).toList(),
      ),
    );
  }
}

class _CityTile extends StatelessWidget {
  final City city;

  const _CityTile({required this.city});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CityCubit>().selectCity(city);
        // TODO: navigation to main screen
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1F1F1F),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city.name,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${city.branches} филиалов',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
