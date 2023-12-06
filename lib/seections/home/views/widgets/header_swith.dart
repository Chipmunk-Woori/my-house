import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/basic_switch.dart';
import '../../../../common/widgets/basic_icon.dart';

class HeaderSwitch extends StatefulWidget {
  HeaderSwitch({
    super.key,
    required this.isOn,
    required this.icon,
    required this.onTap,
  });

  bool isOn;
  String icon;
  VoidCallback onTap;

  @override
  State<HeaderSwitch> createState() => _HeaderSwitchState();
}

class _HeaderSwitchState extends State<HeaderSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BasicIcon(
          icon: widget.icon,
        ),
        BasicSwitch(
          isOn: widget.isOn,
          onTap: widget.onTap,
        ),
      ],
    );
  }
}
