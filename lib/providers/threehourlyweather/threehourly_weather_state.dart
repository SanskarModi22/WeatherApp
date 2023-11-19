import 'package:weather_app/models/three_hours_model.dart';

sealed class ThreeHourlyWeatherState {}

class ThreeHourlyWeatherLoading extends ThreeHourlyWeatherState {}

class ThreeHourlyWeatherSuccess extends ThreeHourlyWeatherState {
  final ThreeHoursModel threeHoursModel;

  ThreeHourlyWeatherSuccess({required this.threeHoursModel});
}

class ThreeHourlyWeatherFailure extends ThreeHourlyWeatherState {
  final String errorMessage;

  ThreeHourlyWeatherFailure({required this.errorMessage});
}
