import 'package:flutter/material.dart';
import 'package:muzhiki_pro/di.dart';
import 'package:muzhiki_pro/features/city_selection/domain/repository/city_repository.dart';
import 'package:muzhiki_pro/features/city_selection/presentation/pages/city_selection_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDi();

  final city = getIt<CityRepository>().getSavedCity();
  getIt<CityRepository>().clearCity();
  runApp(MyApp(showCitySelection: city == null));
}

class MyApp extends StatelessWidget {
  final bool showCitySelection;

  const MyApp({super.key, required this.showCitySelection});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мужики Про',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: showCitySelection ? const CitySelectionPage() : const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Главный экран')));
  }
}
