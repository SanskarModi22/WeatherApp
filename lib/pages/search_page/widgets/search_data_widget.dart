// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/search_city_model.dart';

class SearchData extends ConsumerWidget {
  const SearchData({
    Key? key,
    required this.searchCityData,
  }) : super(key: key);

  final SearchCityModel searchCityData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger logger = Logger();
    logger.e(searchCityData.main?.temp);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${searchCityData.name}',
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${searchCityData.main!.temp! - 273.15}'.substring(0, 2),
              //'${(searchCityData.main?.temp).toString().substring(0, 2)} °C',
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'RussoOne',
              ),
            ),
            const Text(
              ' \u2103',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '${searchCityData.weather?.first.main}',
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
