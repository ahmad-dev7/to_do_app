import 'dart:ui';

import 'package:flutter/material.dart';

class SheetContainer extends StatelessWidget {
  final double height;
  final String img;
  final Widget child;
  const SheetContainer({
    super.key,
    required this.height,
    required this.img,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(img),
            opacity: 0.2,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.linearToSrgbGamma()),
        color: const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        blendMode: BlendMode.srcIn,
        child: child,
      ),
    );
  }
}
