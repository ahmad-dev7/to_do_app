import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function() onTap;
  final Color color;
  final Color? bgColor;
  final IconData icon;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.icon,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: bgColor ?? Colors.blueGrey.shade900,
      minWidth: 5,
      height: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
