import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';

class BodyText extends StatelessWidget {
  const BodyText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        color: basicTextColor,
      ),
    );
  }
}
