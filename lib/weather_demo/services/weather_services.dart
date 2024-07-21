import 'dart:convert';

import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherServices {
  final String apiKey;

  WeatherServices({required this.apiKey});

  Future<Weather> getCurrentWeather(String cityName) async {
    var client = http.Client();
    var uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
    });
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return Weather.fromJson(jsonDecode(json));
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Future<String> getCurrentCity() async {
    return Future(() => "China");
    // LocationPermission permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    // }
    // Position position = await Geolocator.getCurrentPosition();
    // List<Placemark> placemarks =
    //     await placemarkFromCoordinates(position.latitude, position.longitude);
    // String? city = placemarks.first.locality;
    // return city ?? 'Unknown';
  }
}
