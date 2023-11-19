import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/three_hours_model.dart';
import 'package:weather_app/providers/threehourlyweather/threehourly_weather_state.dart';
import 'package:weather_app/repositories/current_weather_service.dart';

class ThreeHourlyWeatherNotifier extends Notifier<ThreeHourlyWeatherState> {
  ThreeHourlyWeatherState threeHourlyWeatherState = ThreeHourlyWeatherLoading();
  @override
  ThreeHourlyWeatherState build() {
    return threeHourlyWeatherState;
  }

  late final CurrentWeatherService currentWeatherService =
      CurrentWeatherService();

  void threeHourlyWeather({required String name}) async {
    try {
      state = ThreeHourlyWeatherLoading();

      ThreeHoursModel threeHourlyData =
          await currentWeatherService.getThreeHourlyWeather(name: name);

      state = ThreeHourlyWeatherSuccess(threeHoursModel: threeHourlyData);
    } catch (e) {
      state = ThreeHourlyWeatherFailure(errorMessage: e.toString());
    }
  }
}
