// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app/constants/color_const.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    Key? key,
    required this.currentWeather,
  }) : super(key: key);

  final CurrentWeatherModel currentWeather;

  @override
  Widget build(BuildContext context) {
    var dt = DateTime.fromMillisecondsSinceEpoch(currentWeather.dt! * 1000);

    var date = DateFormat('hh:mm a').format(dt);
    return Text(
      date,
      style: const TextStyle(
        fontFamily: 'OpenSans',
        color: AppColor.appTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
