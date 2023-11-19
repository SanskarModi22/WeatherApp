import 'package:weather_app/models/search_city_model.dart';

sealed class SearchWeatherState {}

class SearchWeatherForm extends SearchWeatherState {}

class SearchWeatherLoading extends SearchWeatherState {}

class SearchWeatherSuccess extends SearchWeatherState {
  final SearchCityModel searchCityModel;

  SearchWeatherSuccess({required this.searchCityModel});
}

class SearchWeatherFailure extends SearchWeatherState {
  final String errorMessage;
  SearchWeatherFailure({required this.errorMessage});
}
