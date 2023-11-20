import 'package:flutter/material.dart';
import 'package:weather_app/constants/color_const.dart';
import 'package:weather_app/models/search_city_model.dart';
import 'package:weather_app/pages/home_page/widgets/date_time_widget.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({
    super.key,
    required this.currentWeather,
  });

  final SearchCityModel currentWeather;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: AppColor.appTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  DateTimeWidget(currentWeather: currentWeather),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${(currentWeather.main!.temp! - 273.15).toString().substring(0, 2)} °C',
                    style: const TextStyle(
                      fontFamily: 'RussoOne',
                      color: AppColor.appTextColor,
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      currentWeather.weather!.first.main!.toEmoji(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        color: Colors.teal,
                        size: 19,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${currentWeather.name}, ${currentWeather.sys?.country}',
                        style: const TextStyle(
                          color: AppColor.appTextColor,
                          fontFamily: 'OpenSans',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Text(
                    currentWeather.weather!.first.main ?? '',
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on String {
  String toEmoji() {
    switch (this) {
      case 'Clear':
        return 'assets/images/sunny.png';
      case 'Rain':
        return 'assets/images/rain.png';
      case 'Clouds':
        return 'assets/images/cloudy.png';
      case 'Wind':
        return 'assets/images/windy.png';
      case 'Mist':
        return 'assets/images/light_rain.png';
      case 'Haze':
        return 'assets/images/haze.png';
      case 'Smoke':
        return 'assets/images/smog-solid.png';
      default:
        return '?';
    }
  }
}
