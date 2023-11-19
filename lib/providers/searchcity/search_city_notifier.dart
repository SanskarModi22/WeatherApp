import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/search_city_model.dart';
import 'package:weather_app/providers/searchcity/search_city_state.dart';
import 'package:weather_app/repositories/current_weather_service.dart';

class SearchCityWeatherNotifier extends Notifier<SearchWeatherState> {
  SearchWeatherState searchWeatherState = SearchWeatherForm();
  @override
  SearchWeatherState build() {
    return searchWeatherState;
  }

  late final CurrentWeatherService currentWeatherService =
      CurrentWeatherService();

  void searchCity({required String name}) async {
    try {
      state = SearchWeatherLoading();

      SearchCityModel searchCityData =
          await currentWeatherService.getSearchCityWeather(name: name);
      final location = ref.read(locationProvider.notifier);
      location.state = Location(
        latitude: searchCityData.coord!.lat!,
        longitude: searchCityData.coord!.lon!,
      );
      state = SearchWeatherSuccess(searchCityModel: searchCityData);
    } catch (e) {
      state = SearchWeatherFailure(errorMessage: e.toString());
    }
  }
}
