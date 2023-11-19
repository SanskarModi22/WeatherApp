import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/constants/color_const.dart';
import 'package:weather_app/models/three_hours_model.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key, required this.threeHourlyWeatherData});

  final ThreeHoursModel threeHourlyWeatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Weather Today',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.appTextColor,
              ),
            ),
            Row(
              children: [
                Text(
                  'Next 5 days',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.appTextColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 12,
                  color: AppColor.appTextColor,
                )
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 8),
          margin: const EdgeInsets.only(
            top: 15,
            bottom: 20,
          ),
          height: 170,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: threeHourlyWeatherData.list?.length,
              itemBuilder: (context, index) {
                //final hourlyData = threeHourlyWeatherData.list?.first;

                String formattedDate = DateFormat.MMMMd()
                    .format(threeHourlyWeatherData.list![index].dtTxt!);
                String formattedTime = DateFormat('hh:mm a')
                    .format(threeHourlyWeatherData.list![index].dtTxt!);

                final degreeC = threeHourlyWeatherData.list?[index].main?.temp;

                final weather = threeHourlyWeatherData.list?[index].weather;

                Logger logger = Logger();
                logger.d(weather?.length);

                for (var result in weather!) {
                  logger.f(result.main);
                }

                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 8,
                        bottom: 8,
                      ),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            '${weather.map((e) => e.main)}'
                                .replaceAll(RegExp(r'\(|\)'), '')
                                .toEmoji(),
                            width: 70,
                            height: 70,
                          ),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            formattedTime,
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${(degreeC! - 273.15).toString().substring(0, 2)}\u2103',
                            style: const TextStyle(
                              fontFamily: 'RussoOne',
                              fontSize: 16,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}

extension on String {
  String toEmoji() {
    switch (this) {
      case 'MainEnum.Clear':
        return 'assets/images/sunny.png';
      case 'MainEnum.RAIN':
        return 'assets/images/rain.png';
      case 'MainEnum.Clouds':
        return 'assets/images/cloudy.png';
      case 'MainEnum.Wind':
        return 'assets/images/windy.png';
      default:
        return 'assets/images/cloudy.png';
    }
  }
}
