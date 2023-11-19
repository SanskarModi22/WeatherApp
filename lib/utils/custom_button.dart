import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, // Optional key for identifying the widget
    required this.text, // Text to be displayed on the button
    this.onTap, // Callback function to be executed when the button is tapped
  });

  final String text; // Text displayed on the button
  final VoidCallback? onTap; // Callback function when the button is tapped

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Register the onTap callback
      child: Container(
        width: 120,
        height: 35,
        decoration: BoxDecoration(
          color: const Color(0xFF8D0326), // Background color
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white, // Text color
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
