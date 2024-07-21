import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils.dart';
import '../models/weather_model.dart';
import '../services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherServices _weatherServices =
      WeatherServices(apiKey: 'eef6105ab5559032a0e3619a750993d5');

  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherServices.getCurrentCity();

    try {
      final weather = await _weatherServices.getCurrentWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  String getWeatchAssert(String? condition) {
    if (condition == null) return 'asset/lottie/sunshine.json';
    String w = condition.toLowerCase();
    switch (w) {
      case 'clouds':
        return 'asset/lottie/cloud.json';
      case 'rain':
        return 'asset/lottie/rain.json';
      case 'clear':
        return 'asset/lottie/sun.json';
      default:
        return 'asset/lottie/sunshine.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
          actions: [
            IconButton(
              onPressed: () {
                exitApp();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // city name

          Text(_weather?.cityName ?? "Loading...",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),

          // animation
          Lottie.asset("asset/lottie/sun.json"),

          // temperature

          Text(
            "${_weather?.temperatureCelsius.toStringAsFixed(1)}°C",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text("${_weather?.mainCondition}"),
        ])));
  }
}
