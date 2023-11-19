import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/pages/home_page/widgets/navigation_bar_widget.dart';
import 'package:weather_app/pages/LogIn/login_page.dart';
import 'package:weather_app/pages/profile_page/weather_page.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/utils/error_screen.dart';
import 'package:weather_app/utils/loading_screen.dart';

@RoutePage()
class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the authentication state using the authStateProvider
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (data) {
        print(data);
        // If authentication data is available
        if (data != null) {
          return const NavigationBarWidget(); // Show the HomePage widget
        } else {
          print("Kaise Ho");
          return const LoginPage(); // Show the LoginPage widget
        }
      },
      loading: () =>
          const LoadingScreen(), // Show a loading screen while checking authentication state
      error: (e, trace) => ErrorScreen(e,
          trace), // Show an error screen if an error occurs during authentication
    );
  }
}
