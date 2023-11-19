import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/color_const.dart';

import 'package:weather_app/main.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/three_hours_model.dart';
import 'package:weather_app/pages/home_page/widgets/custom_app_bar.dart';
import 'package:weather_app/pages/home_page/widgets/shimmer_widget.dart';
import 'package:weather_app/pages/home_page/widgets/weather_card_widget.dart';
import 'package:weather_app/pages/home_page/widgets/weather_description.dart';
import 'package:weather_app/pages/home_page/widgets/weather_forecast.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/providers/currentWeather/current_weather_provider.dart';
import 'package:weather_app/providers/currentWeather/current_weather_state.dart';
import 'package:weather_app/providers/threehourlyweather/threehourly_weather_provider.dart';
import 'package:weather_app/providers/threehourlyweather/threehourly_weather_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    loadedThreeHourlyData();
  }

  loadedData({required double lat, required double long}) {
    Future.delayed(
      Duration.zero,
      () => ref
          .read(currentWeatherProvider.notifier)
          .currentWeather(lat.toString(), long.toString()),
    );
  }

  loadedThreeHourlyData() {
    Future.delayed(
      Duration.zero,
      () => ref
          .read(threeHourlyWeatherProvider.notifier)
          .threeHourlyWeather(name: 'agra'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(fireBaseAuthProvider);
    String imgUrl = data.currentUser!.photoURL!;
    // Second variable to access the Logout Function

    final location = ref.read(locationProvider);
    loadedData(lat: location.latitude, long: location.longitude);
    CurrentWeatherState currentWeatherList = ref.read(currentWeatherProvider);
    ThreeHourlyWeatherState threeHourlyWeatherDataList =
        ref.watch(threeHourlyWeatherProvider);
    return Scaffold(
      backgroundColor: AppColor.appBGColor,
      appBar: CustomAppBar(
        imgUrl: imgUrl,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCurrentWeatherResult(currentWeatherList),
            // _buildThreeHourlyWeatherResult(threeHourlyWeatherDataList),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentWeatherResult(CurrentWeatherState currentWeatherState) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: switch (currentWeatherState) {
        CurrentWeatherLoading() => ShimmerWidget(context: context),
        CurrentWeatherSuccess(
          currentWeatherModel: CurrentWeatherModel currentWeather
        ) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherCardWidget(currentWeather: currentWeather),
              const SizedBox(
                height: 20,
              ),
              WeatherDescription(
                currentWeather: currentWeather,
              ),
              const SizedBox(
                height: 20,
              ),
              // const WeatherForecast(),
            ],
          ),
        CurrentWeatherFailure(errorMessage: String error) => Text(error),
      },
    );
  }

  Widget _buildThreeHourlyWeatherResult(
      ThreeHourlyWeatherState threeHourlyWeatherState) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: switch (threeHourlyWeatherState) {
        ThreeHourlyWeatherLoading() => const SizedBox(),
        ThreeHourlyWeatherSuccess(
          threeHoursModel: ThreeHoursModel threeHourData
        ) =>
          WeatherForecast(threeHourlyWeatherData: threeHourData),
        ThreeHourlyWeatherFailure(errorMessage: String error) => Text(error),
      },
    );
  }
}
