import 'package:flutter/material.dart';

class BodyGrayText extends StatelessWidget {
  const BodyGrayText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        color: Colors.black45,
      ),
    );
  }
}
