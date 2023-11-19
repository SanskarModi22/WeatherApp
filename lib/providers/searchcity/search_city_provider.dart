import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/searchcity/search_city_notifier.dart';
import 'package:weather_app/providers/searchcity/search_city_state.dart';

final searchCityWeatherProvider =
    NotifierProvider<SearchCityWeatherNotifier, SearchWeatherState>(
  () {
    return SearchCityWeatherNotifier();
  },
);
