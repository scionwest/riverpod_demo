import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_shell_ex/data/weather_repository.dart';
import 'package:routing_shell_ex/models/weather.dart';

final weatherFutureProvider = FutureProvider.autoDispose<Weather>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return weatherRepository.getWeather('London');
});

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository();
});
