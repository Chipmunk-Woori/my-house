import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicButton extends StatefulWidget {
  const BasicButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  State<BasicButton> createState() => _BasicButtonState();
}

class _BasicButtonState extends State<BasicButton> {
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: ghostColor),
        ),
        alignment: Alignment.center,
        height: 50.h,
        width: fullWidth * 0.7.w,
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: title_1.sp,
            color: ghostColor,
          ),
        ),
      ),
    );
  }
}
