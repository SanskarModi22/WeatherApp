import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/api_const.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/providers/currentWeather/current_weather_state.dart';
import 'package:weather_app/repositories/current_weather_service.dart';

class CurrentWeatherNotifier extends Notifier<CurrentWeatherState> {
  CurrentWeatherState currentWeatherState = CurrentWeatherLoading();
  @override
  CurrentWeatherState build() {
    return currentWeatherState;
  }

  late final CurrentWeatherService _currentWeatherService =
      CurrentWeatherService();

  void currentWeather(String lat, String lon) async {
    try {
      state = CurrentWeatherLoading();

      CurrentWeatherModel currentWeatherData =
          await _currentWeatherService.getCurrentWeather(
              lat: lat, lon: lon, appid: ApiConst.appid.toString());

      state = CurrentWeatherSuccess(currentWeatherModel: currentWeatherData);
    } catch (e) {
      state = CurrentWeatherFailure(errorMessage: e.toString());
    }
  }
}
