import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/common/style/common_style.dart';

class BasicSwitch extends StatefulWidget {
  const BasicSwitch({
    super.key,
    required this.isOn,
    required this.onTap,
  });

  final bool isOn;
  final VoidCallback onTap;

  @override
  State<BasicSwitch> createState() => _BasicSwitchState();
}

class _BasicSwitchState extends State<BasicSwitch> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: widget.isOn,
      onChanged: (value) {
        widget.onTap();
      },
      activeColor: pointColor,
    );
  }
}
