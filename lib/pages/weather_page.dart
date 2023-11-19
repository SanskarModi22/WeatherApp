import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/custom_style.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/utils/custom_button.dart';

@RoutePage()
class WeatherPage extends ConsumerStatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends ConsumerState<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(fireBaseAuthProvider);

    // Second variable to access the Logout Function
    final auth = ref.watch(authenticationProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Signed in as: ${data.currentUser!.displayName}',
              style: kCityTextStyle,
            ),
            CustomButton(
              onTap: () {
                auth.signOut();
              },
              text: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}
