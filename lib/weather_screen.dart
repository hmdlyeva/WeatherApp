import 'dart:ui';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
      body: Padding(
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
            const SizedBox(height: 16),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
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
            const SizedBox(height: 20),

           const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.water_drop,
                      size: 32,
                    ),
                     SizedBox(height: 8),
                    Text('Humidity'),
                     SizedBox(height: 8),
                    Text(
                      '94',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.wind_power,
                      size: 32,
                    ),
                     SizedBox(height: 8),
                    Text('Wind Speed'),
                     SizedBox(height: 8),
                    Text(
                      '7.67',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.umbrella,
                      size: 32,
                    ),
                     SizedBox(height: 8),
                    Text('Pressure'),
                     SizedBox(height: 8),
                    Text(
                      '1006',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HourlyForecastItem extends StatefulWidget {
  const HourlyForecastItem({super.key});

  @override
  State<HourlyForecastItem> createState() => _HourlyForecastItemState();
}

class _HourlyForecastItemState extends State<HourlyForecastItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: const Column(children: [
          Text(
            '03:00',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Icon(
            Icons.cloud,
            size: 32,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '300.41',
          ),
        ]),
      ),
    );
  }
}
