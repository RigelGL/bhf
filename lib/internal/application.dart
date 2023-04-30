import 'package:bhf/presentation/cities.dart';
import 'package:bhf/presentation/city_fuel.dart';
import 'package:bhf/presentation/gr.dart';
import 'package:bhf/presentation/splash.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      locale: const Locale('ru'),
      initialRoute: '/splash',
      routes: {
        '/': (context) => const CitiesPage(),
        '/splash': (context) => const SplashPage(),
        '/fuel': (context) => const CityFuelPage(),
        '/log': (context) => const GrPage(),
      },
    );
  }
}
