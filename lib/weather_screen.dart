import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';
// import 'package:weather_app/page2.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  List datas = [];

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    try {
      final res = await http
          .get(Uri.parse('https://userapideployda.onrender.com/users'));

      final data = jsonDecode(res.body);

      for (int i = 0; i < data.length; i++) {
        datas.add(data[i]);
      }

      // if (data['name'] == 'hamida') {
      //   print(data['name']);
      // } else {
      //   print('olmadi');
      // }
      // print(data[1]['name']);
      // print(data[1]['surname']);
      // print(data[1]['wishlist']);
      // print(data.length);
    } catch (e) {
      throw e;
    }
    // print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print('refresh');
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //main card
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              '300°F',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Icon(
                              Icons.cloud,
                              size: 64,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Rain',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              //forecast cards
              const Text(
                'Weather Forecast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HourlyForecastItem(time: '00:00', temperature: '300.41'),
                    HourlyForecastItem(time: '03:00', temperature: '300.41'),
                    HourlyForecastItem(time: '05:00', temperature: '300.41'),
                    HourlyForecastItem(time: '08:00', temperature: '300.41'),
                    HourlyForecastItem(time: '14:00', temperature: '300.41'),
                    HourlyForecastItem(time: '18:00', temperature: '300.41'),
                    HourlyForecastItem(time: '21:00', temperature: '300.41'),
                  ],
                ),
              ),

              // const Placeholder(fallbackHeight: 150),
              const SizedBox(height: 20),
              //add info
              const Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalInfoItem(
                    icon: Icons.water_drop,
                    label: 'Humidity',
                    value: '91',
                  ),
                  AdditionalInfoItem(
                    icon: Icons.air,
                    label: 'Wind Speed',
                    value: '7.67',
                  ),
                  AdditionalInfoItem(
                    icon: Icons.beach_access,
                    label: 'Pressure',
                    value: '1006',
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: datas.map((data) {
                    return Card(
                      elevation: 6,
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '${data['name']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${data['surname']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: datas.map((data) {
                    return Card(
                      elevation: 6,
                      child: Container(
                        width: 120,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '${data['password']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${data['username']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Go To Page2'),
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Page2()));
                    Navigator.pushNamed(context, 'page2');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
