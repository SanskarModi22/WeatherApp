import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/color_const.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.imgUrl});
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.appBGColor,
      shadowColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: const Icon(
        CupertinoIcons.list_bullet,
        color: Color(0xFF191D28),
        size: 20,
      ),
      title: const Text(
        'Weather Forecast',
        style: TextStyle(
          fontFamily: 'OpenSans',
          color: Color(0xFF191D28),
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            backgroundImage: NetworkImage(imgUrl),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
