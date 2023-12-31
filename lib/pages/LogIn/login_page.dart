import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/color_const.dart';
import 'package:weather_app/constants/custom_style.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/repositories/auth_repo.dart';
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

  Future<void> loginWithGoogle({required Authentication auth}) async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBGColor,
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final auth = ref.watch(authenticationProvider);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/weather.png',
                    height: 450,
                  ),
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
                              await loginWithGoogle(auth: auth);
                              // ignore: use_build_context_synchronously
                              AutoRouter.of(context)
                                  .push(const NavigationBarWidget());
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  "assets/images/google-logo.png",
                                  width: 35,
                                ),
                                const Text(
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
            );
          },
        ),
      ),
    );
  }
}
