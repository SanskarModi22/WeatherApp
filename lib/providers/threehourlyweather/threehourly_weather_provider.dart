import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/threehourlyweather/threehourly_weather_notifier.dart';
import 'package:weather_app/providers/threehourlyweather/threehourly_weather_state.dart';

final threeHourlyWeatherProvider =
    NotifierProvider<ThreeHourlyWeatherNotifier, ThreeHourlyWeatherState>(
  () {
    return ThreeHourlyWeatherNotifier();
  },
);
