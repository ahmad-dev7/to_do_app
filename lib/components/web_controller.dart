import 'package:flutter/material.dart';

class WebController extends StatelessWidget {
  final Widget child;
  const WebController({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size.width < 450
        ? child
        : SizedBox(
            width: 437,
            height: size.height - 100,
            child: child,
          );
  }
}
