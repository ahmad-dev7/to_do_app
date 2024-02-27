import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_shadow/simple_shadow.dart';

class BottomSheetIcon extends StatelessWidget {
  final Widget? child;
  const BottomSheetIcon({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: -10,
      child: Align(
        alignment: Alignment.topCenter,
        child: SimpleShadow(
          offset: const Offset(10, 10),
          color: Colors.black,
          sigma: 10,
          child: child ??
              Image.asset(
                'images/list_icon.png',
                height: 100,
              ),
        )
            .animate()
            .fade(delay: const Duration(milliseconds: 400))
            .then()
            .shake(),
      ),
    );
  }
}
