class Weather {
  final String cityName;
  final double temperatureCelsius;
  final String mainCondition;

  Weather({
    required this.mainCondition,
    required this.cityName,
    required this.temperatureCelsius,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperatureCelsius: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
