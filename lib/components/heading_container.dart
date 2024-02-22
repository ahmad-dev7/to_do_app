import 'dart:ui';
import 'package:flutter/material.dart';

class HeadingContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const HeadingContainer(
      {super.key, required this.child, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: Color(0xFF2B3032),
        image: DecorationImage(
          image: AssetImage('images/wavy_lines.jpg'),
          fit: BoxFit.fill,
          opacity: .6,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 1),
        child: child,
      ),
    );
  }
}
