import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';

class RefrigeratorScreen extends StatefulWidget {
  const RefrigeratorScreen({super.key});

  @override
  State<RefrigeratorScreen> createState() => _RefrigeratorScreenState();
}

class _RefrigeratorScreenState extends State<RefrigeratorScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(commonPadding),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  color: mainColor,
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: pointColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
