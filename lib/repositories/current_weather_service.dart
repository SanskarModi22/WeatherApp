import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:weather_app/constants/api_const.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/search_city_model.dart';
import 'package:weather_app/models/three_hours_model.dart';

class CurrentWeatherService {
  Logger logger = Logger();

  final _url = '${ApiConst.baseUrl}${ApiConst.currentWeatherEndPoint}';

  final _threeHourlyWeatherUrl =
      '${ApiConst.baseUrl}${ApiConst.forecastWeatherEndPoint}';

  final _searchCityWeatherUrl =
      '${ApiConst.baseUrl}${ApiConst.currentWeatherEndPoint}';

  Future<dynamic> getCurrentWeather(
      {required String lat, required String lon, required String appid}) async {
    try {
      var url = Uri.parse(_url)
          .replace(queryParameters: {'lat': lat, 'lon': lon, 'appid': appid});
      CurrentWeatherModel currentWeather;
      var response = await http.get(url);
      logger.w(response.body);

      if (response.statusCode == 200) {
        currentWeather =
            CurrentWeatherModel.fromJson(json.decode(response.body));

        return currentWeather;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getThreeHourlyWeather({required String name}) async {
    try {
      var url = Uri.parse(_threeHourlyWeatherUrl).replace(queryParameters: {
        'q': name,
        'appid': ApiConst.appid,
      });
      ThreeHoursModel threeHoursWeather;

      var response = await http.get(url);

      //logger.f(response.body);
      logger.t(response.statusCode);

      if (response.statusCode == 200) {
        threeHoursWeather = ThreeHoursModel.fromJson(
          json.decode(response.body),
        );
        logger.f(threeHoursWeather.city);
        return threeHoursWeather;
      }
    } catch (e) {
      logger.e(e.toString());
      return e.toString();
    }
  }

  Future<dynamic> getSearchCityWeather({required String name}) async {
    try {
      var url = Uri.parse(_searchCityWeatherUrl)
          .replace(queryParameters: {'q': name, 'appid': ApiConst.appid});

      SearchCityModel searchCity;

      var response = await http.get(url);

      logger.e(response.statusCode);

      if (response.statusCode == 200) {
        logger.w(response.body);
        searchCity = SearchCityModel.fromJson(
          json.decode(response.body),
        );
        logger.i(searchCity.name);
        return searchCity;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
