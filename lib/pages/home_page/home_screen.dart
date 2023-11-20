import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/color_const.dart';

// import 'package:weather_app/main.dart';
// import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/search_city_model.dart';
// import 'package:weather_app/models/three_hours_model.dart';
import 'package:weather_app/pages/home_page/widgets/custom_app_bar.dart';
import 'package:weather_app/pages/home_page/widgets/shimmer_widget.dart';
import 'package:weather_app/pages/home_page/widgets/weather_card_widget.dart';
import 'package:weather_app/pages/home_page/widgets/weather_description.dart';
// import 'package:weather_app/pages/home_page/widgets/weather_forecast.dart';
import 'package:weather_app/providers/auth_provider.dart';
// import 'package:weather_app/providers/currentWeather/current_weather_provider.dart';
// import 'package:weather_app/providers/currentWeather/current_weather_state.dart';
import 'package:weather_app/providers/searchcity/search_city_provider.dart';
import 'package:weather_app/providers/searchcity/search_city_state.dart';
// import 'package:weather_app/providers/threehourlyweather/threehourly_weather_provider.dart';
// import 'package:weather_app/providers/threehourlyweather/threehourly_weather_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // void initState() {
  //   super.initState();

  //   loadedThreeHourlyData();
  // }

  // loadedData({required double lat, required double long}) {
  //   Future.delayed(
  //     Duration.zero,
  //     () => ref
  //         .read(currentWeatherProvider.notifier)
  //         .currentWeather(lat.toString(), long.toString()),
  //   );
  // }

  // loadedThreeHourlyData() {
  //   Future.delayed(
  //     Duration.zero,
  //     () => ref
  //         .read(threeHourlyWeatherProvider.notifier)
  //         .threeHourlyWeather(name: 'agra'),
  //   );
  // }
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SearchWeatherState searchWeatherData = ref.watch(searchCityWeatherProvider);
    final searchCity = ref.read(searchCityWeatherProvider.notifier);
    final data = ref.watch(fireBaseAuthProvider);
    String imgUrl = data.currentUser!.photoURL!;
    // Second variable to access the Logout Function

    // final location = ref.read(locationProvider);
    // loadedData(lat: location.latitude, long: location.longitude);
    // CurrentWeatherState currentWeatherList = ref.read(currentWeatherProvider);
    // ThreeHourlyWeatherState threeHourlyWeatherDataList =
    //     ref.watch(threeHourlyWeatherProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.appBGColor,
      appBar: CustomAppBar(
        imgUrl: imgUrl,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Column(
                children: [
                  SearchBar(
                    controller: searchTextController,
                    elevation: MaterialStateProperty.all(0),
                    hintText: 'Enter city name (eg. Bengaluru...)',
                    hintStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 14,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFF3F6FB)),
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    trailing: [
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blue.shade100,
                          ),
                        ),
                        onPressed: () {
                          searchCity.searchCity(
                              name: searchTextController.text.trim());
                        },
                        icon: const Icon(
                          CupertinoIcons.search,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildCurrentWeatherResult(searchWeatherData),
            // _buildThreeHourlyWeatherResult(threeHourlyWeatherDataList),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentWeatherResult(SearchWeatherState searchWeatherState) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: switch (searchWeatherState) {
        SearchWeatherForm() => const Text(
            'Please search a city weather',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        SearchWeatherLoading() => Center(
            child: ShimmerWidget(context: context),
          ),
        SearchWeatherSuccess(searchCityModel: SearchCityModel searchCity) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherCardWidget(currentWeather: searchCity),
              const SizedBox(
                height: 20,
              ),
              WeatherDescription(
                currentWeather: searchCity,
              ),
              const SizedBox(
                height: 20,
              ),
              // const WeatherForecast(),
            ],
          ),
        SearchWeatherFailure(errorMessage: String error) => const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Text(
                "City Entered doesnot exist.\n        Please try again!!",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
          ),
      },
    );
  }
}
