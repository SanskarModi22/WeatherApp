import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
