import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/color_const.dart';
import 'package:weather_app/models/search_city_model.dart';
import 'package:weather_app/pages/home_page/widgets/custom_app_bar.dart';
import 'package:weather_app/pages/home_page/widgets/shimmer_widget.dart';
import 'package:weather_app/pages/home_page/widgets/weather_card_widget.dart';
import 'package:weather_app/pages/home_page/widgets/weather_description.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/providers/searchcity/search_city_provider.dart';
import 'package:weather_app/providers/searchcity/search_city_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Fetches the weather data state using Riverpod's watch function
    SearchWeatherState searchWeatherData = ref.watch(searchCityWeatherProvider);
    final searchCity = ref.read(searchCityWeatherProvider.notifier);
    final data = ref.watch(fireBaseAuthProvider);
    String imgUrl = data.currentUser!.photoURL!;

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
                  // Search bar for entering city names
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
                          // Triggers city search when the search button is pressed
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
            // Builds the UI based on the state of weather data
            _buildCurrentWeatherResult(searchWeatherData),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentWeatherResult(SearchWeatherState searchWeatherState) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: switch (searchWeatherState) {
        // Shows text when no city is searched yet
        SearchWeatherForm() => const Text(
            'Please search a city weather',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        // Shows loading indicator while fetching weather data
        SearchWeatherLoading() => Center(
            child: ShimmerWidget(context: context),
          ),
        // Displays weather information when data is successfully fetched
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
              // Weather forecast widget to be added here
            ],
          ),
        // Shows error message when city entered doesn't exist
        SearchWeatherFailure(errorMessage: String _) => const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Text(
                "City Entered does not exist.\nPlease try again!!",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
          ),
      },
    );
  }
}
