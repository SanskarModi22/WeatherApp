import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConst {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/';

  static const currentWeatherEndPoint = 'weather';

  static const searchWeatherEndPoint = 'weather';

  static const forecastWeatherEndPoint = 'forecast';

  static final appid = dotenv.env['API_KEY'];
}
