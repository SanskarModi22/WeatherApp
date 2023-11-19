import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/currentWeather/current_weather_notifier.dart';
import 'package:weather_app/providers/currentWeather/current_weather_state.dart';

final currentWeatherProvider =
    NotifierProvider<CurrentWeatherNotifier, CurrentWeatherState>(
  () => CurrentWeatherNotifier(),
);
