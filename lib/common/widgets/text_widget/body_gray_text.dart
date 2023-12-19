import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyGrayText extends StatelessWidget {
  const BodyGrayText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 15.sp,
        color: basicTextColor,
      ),
    );
  }
}
