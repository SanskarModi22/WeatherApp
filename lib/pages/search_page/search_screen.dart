import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_app/main.dart';
import 'package:weather_app/models/search_city_model.dart';
import 'package:weather_app/pages/search_page/widgets/search_data_widget.dart';
import 'package:weather_app/providers/searchcity/search_city_provider.dart';
import 'package:weather_app/providers/searchcity/search_city_state.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    SearchWeatherState searchWeatherData = ref.watch(searchCityWeatherProvider);
    final searchCity = ref.read(searchCityWeatherProvider.notifier);

    TextEditingController searchTextController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 30,
              ),
              child: Column(
                children: [
                  SearchAnchor(builder:
                      (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: searchTextController,
                      elevation: MaterialStateProperty.all(0),
                      hintText: 'Enter city name (eg. myanmar...)',
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
                                name: searchTextController.text);
                          },
                          icon: const Icon(
                            CupertinoIcons.search,
                            size: 20,
                          ),
                        ),
                      ],
                    );
                  }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          // setState(() {
                          //   controller.closeView(item);
                          // });
                        },
                      );
                    });
                  }),
                ],
              ),
            ),
            Expanded(
              child: _buildSearchBarDataWidget(searchWeatherData),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBarDataWidget(SearchWeatherState searchWeatherState) {
    return Center(
      child: switch (searchWeatherState) {
        SearchWeatherForm() => const Text(
            'Please search a city weather',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        SearchWeatherLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        SearchWeatherSuccess(searchCityModel: SearchCityModel searchCity) =>
          SearchData(searchCityData: searchCity),
        SearchWeatherFailure(errorMessage: String error) => Center(
            child: Text(error),
          ),
      },
    );
  }
}
