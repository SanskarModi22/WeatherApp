import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/constants/custom_style.dart';
import 'package:weather_app/pages/weather_page.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/routes/app_router.gr.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false; // A variable to track the loading state.

  // Function to toggle the loading state.
  void loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final auth = ref.watch(authenticationProvider);

            // Function to initiate Google login and handle loading.
            Future<void> loginWithGoogle() async {
              loading(); // Start loading animation.
              await auth.signInWithGoogle(context).whenComplete(() {
                auth.authStateChange.listen((event) async {
                  if (event == null) {
                    loading(); // Stop loading animation.
                    return;
                  }
                });
              });
            }

            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'NOVA Weather App',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Image.asset(
                    //   'assets/weather.png',
                    //   height: 300,
                    // ),
                    const SizedBox(
                      height: 50,
                    ),
                    // Display Google sign-in button when not loading.
                    SizedBox(
                      height: 75,
                      width: 325,
                      child: !_isLoading
                          ? ElevatedButton(
                              onPressed: () async {
                                await loginWithGoogle();
                                AutoRouter.of(context)
                                    .push(const WeatherRoute());
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // SvgPicture.asset(
                                  //   'assets/google-icon.svg',
                                  //   width: 25,
                                  // ),
                                  Text(
                                    'SignIn with Google',
                                    style: kSignInWithGoogleTextStyle,
                                  ),
                                ],
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                color: Colors.redAccent,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
