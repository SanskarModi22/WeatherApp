import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/color_const.dart';
import 'package:weather_app/pages/home_page/home_screen.dart';
import 'package:weather_app/pages/profile_page/profile_page.dart';

@RoutePage()
class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  List pages = [
    const HomeScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: AppColor.appBGColor,
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              color: AppColor.appTextColor,
              fontSize: 12,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          animationDuration: const Duration(seconds: 1),
          selectedIndex: currentIndex,
          elevation: 0,
          height: 70,
          backgroundColor: Colors.white,
          onDestinationSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                CupertinoIcons.home,
                color: AppColor.appTextColor,
              ),
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.black38,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                CupertinoIcons.profile_circled,
                color: AppColor.appTextColor,
              ),
              icon: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black38,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
