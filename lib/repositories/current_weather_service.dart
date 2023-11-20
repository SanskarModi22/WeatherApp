import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:weather_app/constants/api_const.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/search_city_model.dart';

class CurrentWeatherService {
  Logger logger = Logger();

  final _searchCityWeatherUrl =
      '${ApiConst.baseUrl}${ApiConst.currentWeatherEndPoint}';

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
