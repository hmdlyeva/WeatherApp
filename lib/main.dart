import 'package:flutter/material.dart';
import 'package:weather_app/page2.dart';
import 'package:weather_app/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const WeatherScreen(),
      routes: {
        'homepage':(context) => const WeatherScreen(),
        'page2':(context) =>  const Page2(),
      }
    );
  }
}
