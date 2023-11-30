import 'package:flutter/material.dart';

class BasicIcon extends StatelessWidget {
  const BasicIcon({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: 25,
      height: 25,
    );
  }
}
