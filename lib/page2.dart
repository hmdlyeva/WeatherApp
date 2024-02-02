import 'package:flutter/material.dart';
// import 'package:weather_app/weather_screen.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P A G E 2'),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text('Go To Home'),
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => WeatherScreen()));
          Navigator.pushNamed(context, 'homepage');
        },
      )),
    );
  }
}
