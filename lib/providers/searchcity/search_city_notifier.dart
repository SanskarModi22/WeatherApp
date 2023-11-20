import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/search_city_model.dart';
import 'package:weather_app/providers/searchcity/search_city_state.dart';
import 'package:weather_app/repositories/current_weather_service.dart';

// Notifier responsible for managing the state of search weather data
class SearchCityWeatherNotifier extends Notifier<SearchWeatherState> {
  // Initializing the initial state to indicate no search has been performed yet
  SearchWeatherState searchWeatherState = SearchWeatherForm();

  @override
  SearchWeatherState build() {
    return searchWeatherState;
  }

  // Initializing the service to fetch current weather data
  late final CurrentWeatherService currentWeatherService =
      CurrentWeatherService();

  // Function to search for a city's weather based on the name entered
  void searchCity({required String name}) async {
    try {
      // Setting state to loading while fetching data
      state = SearchWeatherLoading();

      // Fetching weather data for the entered city name
      SearchCityModel searchCityData =
          await currentWeatherService.getSearchCityWeather(name: name);

      // Storing location information for the searched city in the locationProvider
      final location = ref.read(locationProvider.notifier);
      location.state = Location(
        latitude: searchCityData.coord!.lat!,
        longitude: searchCityData.coord!.lon!,
      );

      // Setting state to success and passing the fetched weather data
      state = SearchWeatherSuccess(searchCityModel: searchCityData);
    } catch (e) {
      // Setting state to failure if an error occurs during fetching
      state = SearchWeatherFailure(errorMessage: e.toString());
    }
  }
}
