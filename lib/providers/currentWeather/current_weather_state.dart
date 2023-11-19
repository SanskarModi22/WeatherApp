// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:weather_app/models/current_weather_model.dart';

sealed class CurrentWeatherState {}

class CurrentWeatherLoading extends CurrentWeatherState {}

class CurrentWeatherSuccess extends CurrentWeatherState {
  CurrentWeatherModel currentWeatherModel;
  CurrentWeatherSuccess({
    required this.currentWeatherModel,
  });
}

class CurrentWeatherFailure extends CurrentWeatherState {
  String errorMessage;
  CurrentWeatherFailure({
    required this.errorMessage,
  });
}
