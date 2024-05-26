import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_shell_ex/data/weather_repository.dart';
import 'package:routing_shell_ex/models/weather.dart';

// Future/StreamProviders should use .autoDispose to
// clean up after themselves when the Widget it is being used in is dismounted.
final weatherFutureProvider = FutureProvider.autoDispose.family<Weather, String>((ref, city) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return weatherRepository.getWeather(city);
});

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository();
});
