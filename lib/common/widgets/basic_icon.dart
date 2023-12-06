import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';

class BasicIcon extends StatelessWidget {
  const BasicIcon({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: 25,
      height: 25,
      color: basicIconColor,
    );
  }
}
