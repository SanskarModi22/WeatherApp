import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/color_const.dart';
import 'package:weather_app/constants/custom_style.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/routes/app_router.gr.dart';
import 'package:weather_app/utils/custom_button.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(fireBaseAuthProvider);

    // Second variable to access the Logout Function
    final auth = ref.watch(authenticationProvider);
    var user = data.currentUser!;
    return Scaffold(
      backgroundColor: AppColor.appBGColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(user.photoURL.toString()),
            ),
            Text(
              'Signed in as: ${user.displayName}',
              style: kCityTextStyle,
            ),
            CustomButton(
              onTap: () async {
                await auth.signOut();
                // ignore: use_build_context_synchronously
                AutoRouter.of(context).push(const LoginRoute());
              },
              text: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}
