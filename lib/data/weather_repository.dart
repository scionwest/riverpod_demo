import 'package:routing_shell_ex/models/weather.dart';

class WeatherRepository {
  final weathers = <Weather>[
    Weather(location: 'London', temperature: 10.0),
    Weather(location: 'New York', temperature: 20.0),
    Weather(location: 'San Francisco', temperature: 30.0),
  ];

  Future<Weather> getWeather(String location) async {
    await Future.delayed(const Duration(seconds: 1));
    return weathers.firstWhere((element) => element.location == location);
  }
}
